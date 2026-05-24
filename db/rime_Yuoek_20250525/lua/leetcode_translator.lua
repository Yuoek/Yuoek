-- leetcode_translator.lua
-- 用于输出 LeetCode Python 代码，支持批量映射

-- 读取代码映射文件
local function loadCodeMappings()
    local mappings = {}
    local file = io.open("code.txt", "r")
    if not file then
        print("无法打开 code.txt 文件")
        return mappings
    end

    local current_key = nil
    local current_code = ""

    for line in file:lines() do
        -- 检查是否是新的键（以 lcpy 开头）
        if line:match("^lcpy%w+$") then
            -- 保存前一个映射
            if current_key and current_code ~= "" then
                mappings[current_key] = current_code
            end
            -- 开始新的映射
            current_key = line
            current_code = ""
        elseif current_key then
            -- 累积代码行
            if current_code == "" then
                current_code = line
            else
                current_code = current_code .. "\n" .. line
            end
        end
    end

    -- 保存最后一个映射
    if current_key and current_code ~= "" then
        mappings[current_key] = current_code
    end

    file:close()
    
    -- 调试：输出所有加载的键
    print("加载的映射键:")
    for k, v in pairs(mappings) do
        print("键: " .. k)
    end
    
    return mappings
end

-- 预加载代码映射
local code_mappings = loadCodeMappings()

-- 调试：输出加载的映射数量
local count = 0
for k, v in pairs(code_mappings) do
    count = count + 1
end
print("DEBUG: Loaded " .. count .. " code mappings")

function translator(input, seg)
    -- 检查输入是否在映射中
    if code_mappings[input] then
        yield(Candidate("lcpy", seg.start, seg._end, code_mappings[input], "💻 LeetCode Python 代码"))
    else
        -- 如果输入匹配lcpy模式但不在映射中，显示所有可用的键
        if input:match("^lcpy%w+$") then
            local available_keys = "可用键: "
            for k, v in pairs(code_mappings) do
                available_keys = available_keys .. k .. " "
            end
            yield(Candidate("debug", seg.start, seg._end, "未找到 '" .. input .. "'， " .. available_keys, "❓ 调试信息"))
        end
    end
end

return translator
