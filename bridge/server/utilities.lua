SS_Utils = {

    VersionCheck = function(resource,repository, paid)
        local currentVersion = GetResourceMetadata(resource, 'version', 0)
        if not currentVersion then
            print("^4Please contact ^0[^5Sky's Scripts^0]^4 for support and reference this error:^0 ".."^3SS_Util.VersionCheck^0, ^1Can't find current resource version for '%s'^0[^3"..resource.."^0]")
            return
        end

        SetTimeout(1000, function()
            PerformHttpRequest(('https://api.github.com/repos/%s/releases/latest'):format(repository), function(status, response)
                if status ~= 200 then
                    if status == 403 or status == 429 then
                        print("[^5Sky's Scripts^0] ^1Update check for ^0[^3"..resource.."^0] ^1failed. ^0[^3Git API Limitations^0]\n^4You may still get this error for a while when restarting the script or server.^0")
                    else
                        print("^4Please contact ^0[^5Sky's Scripts^0]^4 for support and reference this error:^0 ".." [^3SS_Util.VersionCheck^0]\n^1Check repos and current releases for ^0[^3"..resource.."^0] ^4Status code:^0 [^3"..status.."^0]")
                    end
                return end

                response = json.decode(response)
                if response.prerelease then return end

                local latestVersion = response.tag_name:match('%d+%.%d+%.%d+') or response.tag_name:match('%d+%.%d+')
                if not latestVersion then
                    return
                elseif latestVersion == currentVersion then
                    print("[^5Sky's Scripts^0] [^3"..string.upper(string.match(resource, "ss%-(.+)")).."^0] ^2is up to date^0 - ^4Your Version:^0 [^3"..currentVersion.."^0]")
                else
                    local cv = { string.strsplit('.', currentVersion) }
                    local lv = { string.strsplit('.', latestVersion) }

                    local maxParts = math.min(#cv, #lv)
                    for i = 1, maxParts do
                        local current, minimum = tonumber(cv[i] or 0), tonumber(lv[i] or 0)
                        if i == maxParts then
                            if (#cv > i and current == minimum and tonumber(cv[i+1] or 0) > tonumber(lv[i+1] or 0)) or (#cv >= i and current > minimum) then
                                if not paid then
                                    print("[^5Sky's Scripts^0] [^3"..string.upper(string.match(resource, "ss%-(.+)")).."^0] ^4is newer than expected. Your Version:^0 [^3"..currentVersion.."^0] ^4Latest Version:^0 [^3"..latestVersion.."^0]\n^1Please downgrade to latest release through the github or keymaster for ^0[^3"..resource.."^0]\n[^5https://github.com/"..repository.."/releases^0]")
                                elseif paid then
                                    print("[^5Sky's Scripts^0] [^3"..string.upper(string.match(resource, "ss%-(.+)")).."^0] ^4is newer than expected. Your Version:^0 [^3"..currentVersion.."^0] ^4Latest Version:^0 [^3"..latestVersion.."^0]\n^1Please downgrade to latest release for ^0[^3"..resource.."^0] through the keymaster.")
                                end
                            end
                        end
                        if current ~= minimum then
                            if current < minimum then
                                if not paid then
                                    print("[^5Sky's Scripts^0] [^3"..string.upper(string.match(resource, "ss%-(.+)")).."^0] ^4is outdated. Your Version:^0 [^3"..currentVersion.."^0] ^4Latest Version:^0 [^3"..latestVersion.."^0]\n^1Please update ^0[^3"..resource.."^0]^4 through the github or keymaster.^0\n[^5https://github.com/"..repository.."/releases^0]")
                                else
                                    print("[^5Sky's Scripts^0] [^3"..string.upper(string.match(resource, "ss%-(.+)")).."^0] ^4is outdated. Your Version:^0 [^3"..currentVersion.."^0] ^4Latest Version:^0 [^3"..latestVersion.."^0]\n^1Please update ^0[^3"..resource.."^0]^4 through keymaster.^0")
                                end
                            end
                        end
                    end
                end
            end, 'GET')
        end)
    end
}