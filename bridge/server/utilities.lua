SS_Utils = {

    VersionCheck = function(resource,repository, paid)
        local currentVersion = GetResourceMetadata(resource, 'version', 0)
        if currentVersion then
            currentVersion = currentVersion:match('%d%.%d+%.%d+') or currentVersion:match('%d%.%d+')
        else
            print("^4Please contact ^0[^5Sky's Scripts^0]^4 for support and reference this error:^0 ".."^3SS_Util.VersionCheck^0, ^1Can't find current resource version for '%s'^0[^3"..resource.."^0]")
        end

        SetTimeout(1000, function()
            PerformHttpRequest(('https://api.github.com/repos/%s/releases/latest'):format(repository), function(status, response)
                if status ~= 200 then
                    if status == 403 then
                        print("[^5Sky's Scripts^0] ^1Update check for ^0[^3"..resource.."^0] ^1is not available currently. ^0[^3Git API Limitations^0]\n^4You may still get this error if you don't wait a few minutes before restarting the script or server.^0")
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
                    print("[^5Sky's Scripts^0] - [^3"..string.upper(string.match(resource, "ss%-(.+)")).."^0] ^2is up to date^0 - ^4Your Version:^0 [^3"..currentVersion.."^0]")
                else
                    local cv = { string.strsplit('.', currentVersion) }
                    local lv = { string.strsplit('.', latestVersion) }
                
                    for i = 1, #cv do
                        local current, minimum = tonumber(cv[i]), tonumber(lv[i])

                        if current ~= minimum then
                            if current < minimum and not paid then
                                print("[^5Sky's Scripts^0] - [^3"..string.upper(string.match(resource, "ss%-(.+)")).."^0] ^4is outdated^0 - ^4Your Version:^0 [^3"..currentVersion.."^0] \n^4Latest Version:^0 [^3"..latestVersion.."^0] - ^1Please update ^0[^3"..resource.."^0]^4 through the github repo or keymaster.^0\n[^5https://github.com/"..repository.."/releases^0]")
                            elseif current < minimum and paid then
                                print("[^5Sky's Scripts^0] - [^3"..string.upper(string.match(resource, "ss%-(.+)")).."^0] ^4is outdated^0 - ^4Your Version:^0 [^3"..currentVersion.."^0] \n^4Latest Version:^0 [^3"..latestVersion.."^0] - ^1Please update ^0[^3"..resource.."^0]^4 through keymaster.^0")
                            else break end
                        end
                    end
                end
            end, 'GET')
        end)
    end
}