--This script also bypasses slowmode in channels that have slowmode--
--This script (DOES NOT) bypass messages to channels that you can't chat in--

--Game: https://www.roblox.com/games/6342708506/Roblox-Chat-Simulator-2?refPageId=0374cef2-dac3-4fbc-95ed-e388b9d58a11--

getgenv().sending = true
while getgenv().sending do
local args = {{
    ["Message"] = "", --The message that is spammed--
    ["ServerId"] = 0, --Put ServerId here (Got with RemoteSpy)--
    ["Files"] = {
    },
    ["ChannelId"] = 0, --Put ChannelId here (Got with RemoteSpy)--
    ["Type"] = "SERVER",
    ["ReplyMessageId"] = 0
}
}
game.ReplicatedStorage.Functions.SendMessage:InvokeServer(unpack(args))
wait(0.7) --Lowest time is probably 0.7 never tested but if you can find the perfect time then cool--
end