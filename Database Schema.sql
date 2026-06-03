-- 1. 創建資料庫 (如果不存在的話)
CREATE DATABASE IF NOT EXISTS NUITITION 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- 2. 選擇使用該資料庫
USE NUITITION;

-- 3. 創建資料表
CREATE TABLE IF NOT EXISTS food_details (
    id INT AUTO_INCREMENT PRIMARY KEY COMMENT '唯一識別碼',
    whatsapp_remotejid VARCHAR(150) NOT NULL COMMENT 'WhatsApp RemoteJid',
    whatsapp_sender  VARCHAR(150) NOT NULL COMMENT 'WhatsApp Sender',
    record_date DATETIME COMMENT 'Record Date 根據AI的記錄時間',
    meal_time VARCHAR(50) NOT NULL COMMENT '進食時間 (例如: breakfast, lunch)',
    food_name VARCHAR(100) NOT NULL COMMENT '食物名稱 (中文)',
    food_name_en VARCHAR(100) COMMENT '食物名稱 (英文)',
    main_ingredient VARCHAR(100) COMMENT '主要食材',
    cooking_method VARCHAR(50) COMMENT '烹調方式',
    sauce_or_seasoning VARCHAR(100) COMMENT '醬汁或調味料',
    style VARCHAR(50) COMMENT '食物類型/風格',
    -- 營養成分
    calories INT COMMENT '卡路里 (大卡)',
    protein DECIMAL(6,2) COMMENT '蛋白質 (克)',
    fat DECIMAL(6,2) COMMENT '脂肪 (克)',
    carbohydrates DECIMAL(6,2) COMMENT '碳水化合物 (克)',
    fiber DECIMAL(6,2) COMMENT '膳食纖維 (克)',
    
    -- 系統欄位 (必填且自動生成時間)
    create_datetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '資料建立時間'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;