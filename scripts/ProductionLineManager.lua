-- ProductionLineManager.lua
-- This script handles the logic for the Production Line Manager mod.
-- The mod tracks production and animal management and extends the in-game menu to display relevant data.

ProductionLineManager = {}

-- Variable to store the current message to display
ProductionLineManager.currentMessage = nil

function ProductionLineManager:drawMessage(message)
    -- Store the message to be displayed
    self.currentMessage = message
end

function ProductionLineManager:loadMap()    
    -- Display an in-game notification
    g_gui:showInfoDialog({
        text = "Production Line Manager Mod Loaded",
        title = "Mod Notification",
        dialogType = DialogElement.TYPE_INFO
    })

    -- Example: Hook into the in-game menu to extend it
    self.inGameMenu = g_currentMission.inGameMenu
    self:extendMenuPages()

    -- Load initial production and animal data
    self:loadProductionData()
    self:loadAnimalData()

    -- Display a message on screen
    self:drawMessage("Production Line Manager Mod Loaded")
end

function ProductionLineManager:extendMenuPages()
    -- Create a new page in the in-game menu
    local pageId = "productionLineManagerPage"
    self.page = g_gui:loadGui("dataS/scripts/gui/InGameMenuProductionFrame.xml", pageId, self)

    -- Customize the page title and add it to the menu
    self.page.title = "Production Line Manager"
    g_currentMission.inGameMenu:addPage(self.page, pageId)
    
    -- Set this page to be visible in the menu
    self.page.isVisible = true
    
    -- Add custom elements to the page
    self:populatePageWithContent()
end

function ProductionLineManager:populatePageWithContent()
    -- Example: Adding text to the page
    local textElement = self.page:createTextElement()
    textElement:setText("Welcome to the Production Line Manager!")
    textElement:setPosition(0.5, 0.5)
    self.page:addElement(textElement)
end


function ProductionLineManager:loadProductionData()
    -- This function will load data related to production points
    print("Loading Production Data...")
    self:drawMessage("Loading Production Data...")
end

function ProductionLineManager:loadAnimalData()
    -- This function will load data related to animal husbandry
    print("Loading Animal Data...")
    self:drawMessage("Loading Animal Data...")
end

function ProductionLineManager:update(dt)
    -- Called every frame; used to update dynamic information

    
    
    -- If there's a current message, render it for 5 seconds
    if self.currentMessage then
        local x = 0.5  -- Horizontal position (0.0 - 1.0, where 0.5 is the center)
        local y = 0.95  -- Vertical position (0.0 - 1.0, where 0.95 is near the top)
        local size = 0.02  -- Text size
        local colorR, colorG, colorB, colorA = 1, 1, 1, 1  -- White color

        renderText(x, y, size, self.currentMessage)  -- Render the text on the screen

        -- After 5 seconds, clear the message
        setTimer(5000, "clearMessage")
    end    
end

function ProductionLineManager:clearMessage()
    -- Clear the current message
    self.currentMessage = nil
end

-- Register the mod with the game to ensure it runs
addModEventListener(ProductionLineManager)
