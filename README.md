# perhapsHub

**perhapsHub** was created by **[AFriendlyNewUser](https://v3rmillion.net/member.php?action=profile&uid=1730545)**

:warning: **You** may get banned, it is highly recommended to use an alt

# Cross Compatibility Script
  - [ Supports ]
    - Synapse X
    - Sentinel
    - Protosmasher
    - KRNL
    - Sirhurt
    - Proxo
    - Fluxus 
    - EasyExploits
  
  - [ Functions ]
    - File System
      - writefile
      - readfile
      - isfile
      - makefolder
      - delfolder
      - delfile
      - appendfile
      - loadfile
      - isfolder
    - Custom Functions
      - customwarn
        - Usage: customwarn(Title, Text)
        - Example:  
            ```lua 
            API.customwarn("perhapsHub", "Started!")
            ```
      - customprint
        - Usage: customprint(Title, Text)
        - Example: 
            ```lua 
            API.customprint("perhapsHub", "Loaded!")
            ```
      - getfunction
        - Usage: getfunction(Name)
        - Example: 
            ```lua 
            local GetFunction = API.getfunction("writefile")
            if GetFunction ~= false then
              API.customprint("perhapsHub", "Valid Function!")
              GetFunction("perhapsHub.txt", [[print('hey')]])
            end
            ```
      - checkforfunction
        - Usage: checkforfunction(Name)
        - Example:  
            ```lua 
            local CheckForFunction = API.checkforfunction("writefile")
            if GetFunction ~= false then
              API.customprint("perhapsHub", "Valid Function!")
            else
              API.customwarn("perhapsHub", "Invalid Function!")
            end
            ```

# Supported Games
  - Blade Quest
    - Auto Farm
    - Mob TP
    - Auto Attack, Dodge, Support, Damage, Merge, Claim Quests, Equip Best Sword
  - Arsenal
    - Coming Soon
