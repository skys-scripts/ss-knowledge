local colorCodes = {
    error = "^1ERROR^0",
    debug = "^3DEBUG^0",
    warn = "^5WARN^0",
    info = "^2INFO^0",
    success = "^2SUCCESS^0",
}

SS_Log = function(warntype, message, asset, isClient, location, ...)
    local timestamp = nil
    if os and type(os.date) == "function" then
        timestamp = os.date("%Y-%m-%d %H:%M:%S")
    elseif os == nil and not isClient then
        print(string.format("^1Log running client side with isClient variable set to false:^0\n[^3%s^0] [^3%s^0] [^3%s^0] [^3%s^0]", string.upper(warntype), message, asset, location))
    return end
    if warntype == "debug" and not Config.Debug then return end
    if not colorCodes[warntype] then
        warntype = "info"
    end
    local logFormat = isClient and "[^5Sky's Scripts^0] [^3%s^0] [^3%s^0]\n[^3%s^0]" or "[^3%s^0] [^5Sky's Scripts^0] [^3%s^0] [^3%s^0]\n[^3%s^0]"
    local extraInfo = ""
    if warntype == "debug" and location then
        extraInfo = " [^3%s^0]"
    end
    if ... then
        extraInfo = extraInfo.." [^3%s^0]"
    end
    local formattedMessage = string.format(logFormat..extraInfo,
        isClient and asset or timestamp,
        isClient and colorCodes[warntype] or asset,
        isClient and message or colorCodes[warntype],
        isClient and warntype == "debug" and location or message,
        location or "",
        table.concat({...}, ", ") or ""
    )
    print(formattedMessage)
end