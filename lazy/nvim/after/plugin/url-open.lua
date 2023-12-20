-- find the os
local function getOS()
	local handle = io.popen("uname -s")
	local osName = handle:read("*a")
	-- remove leading/trailing whitespace
	osName = osName:match("^%s*(.-)%s*$")

	if osName == "Linux" then 
		return "Linux"
	elseif osName == "Darwin" then
		return "MacOS"
	else
		return "unknown"
	end
end

-- return bash cmd 
local function getOpenCmd(os)
	if os == "Linux" then 
		return "google-chrome "
	elseif os == "MacOS" then
		return 'open -a "Google Chrome" '
	else
		return error("OS did not match {MacOS, Linux}")
	end
end

local function getSelectedText()
	--get start and end positions
	local startPos = vim.fn.getpos("'<")
	local endPos = vim.fn.getpos("'>")
	--extract line numbers
	local startLine = startPos[2]
	local endLine = endPos[2]
	--capture text from that line
	local lines = vim.fn.getline(startLine,endLine)
	local text = table.concat(lines,"\n")
	return text
end

function openChromeWithURL()
	local url = getSelectedText()
	local opSys = getOS()
	local cmd = getOpenCmd(opSys)
	local cmdToExecute = cmd .. url
	local success, errMsg, errCode = os.execute(cmdToExecute)
	if success then 
		print("Chrome opened correctly")
	else
		print("Error opening Chrome: " .. errMsg)
	end
end

-- vim.api.nvim_create_autocmd('FileType', {
-- 	pattern = {'txt','text'},
-- 	callback = function ()
-- 		vim.schedule(function ()
-- 			vim.keymap.set("v", "<leader>go", [[:lua openChromeWithURL(vim.fn.getreg('"'))<CR>]], {buffer=true, noremap=true})
-- 			vim.opt_local.spell = true
-- 		end)
-- 	end
-- })

vim.api.nvim_create_autocmd('FileType', {
    pattern = {'txt','text'},
    callback = function ()
        vim.schedule(function ()
            vim.api.nvim_buf_set_keymap(0, "v", "<leader>go", [[:lua openChromeWithURL()<CR>]], { noremap=true, silent=true })
            vim.opt_local.spell = true
        end)
    end
})
