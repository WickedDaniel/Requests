local function getCode(length)
local chars = "ABCEDFGHIJKLMNOPQRSTUVWYZabcdefghijklmnopqrstuvwxyz1234567890!@#$%^&*()_+}{?><"
	local code = ""
	for i = 1, length do
		local randNum = math.random(1, chars:len())
		code = code .. chars:sub(randNum, randNum)
	end
	return code
end

getgenv().Key = getCode(math.random(1, 50))
