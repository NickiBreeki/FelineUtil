> [!WARNING]
> THIS IS STILL EARLY PHASE OF RELEASE UTILITY, SO IT SUFFICIENT FRAMEWORK SERVICES!

# 🐈 FelineUtil <img src="https://img.shields.io/static/v1?label=version&message=+catframework+v1.0.0&color=2ea44f"></img>
A tool that use in my shift/game development created since 2022, This is seperate away from catframework v1, The code is now readable and more understandable than complexity version.
<br><br>You're free to use this tool in your Game Development Project! 

## INSTALLATION
  <strong>1)</strong> Download the Latest Package in Release Page or Get it on ROBLOX Creator Marketplace!
     <br>
       <a href="https://github.com/NickiBreeki/felineutil/releases">
          <img src="https://img.shields.io/badge/release-informational.svg?style=for-the-badge&logo=github&logoColor"></img>
       </a>
       <a href="https://create.roblox.com/store/asset/17513092224">
          <img src="https://img.shields.io/badge/creator marketplace-informational.svg?style=for-the-badge&logo=roblox&logoColor"></img>
       </a>
       <br>
       ALTERNATIVE You also can download with ROBLOX Command Bar!
```lua
-- // COPY BELOW AND PASTE IN COMMAND BAR, THIS WILL DOWNLOAD AND PLACE IN "ServerScriptService"
game:GetService("InsertService"):LoadAsset(17513092224):GetChildren()[1].Parent = game:GetService("ServerScriptService")
```
<br>
  <strong>2)</strong> After you got the package, Leave the package in <code>ServerScriptService</code> and leave it do thing by itself<br>
<br>

## USAGES
How to use catframework aka FelineUtil? So First off all you need to define the path to the FelineUtil first, by Default Initialization Script will change the Resource Directory to <code>ReplicatedStorage</code>

```lua
-- // SERVICES
local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- // RESOURCES
local Resources = ReplicatedStorage:WaitForChild("FelineUtil")
-- // MODULE
local FelineUtil = require(Resources.main)
```

### HOW DO I IMPORT FELINEUTIL SERVICES?
For example this is how to import 1 service to your script.
```lua
local FelineUtil_Camera = FelineUtil:import("Camera")
```

## CURRENT ALL SERVICES API
> CFrame << Just like normal cframe but CFrame Angle x and y will not be replace. <br><br>
>
> Camera << More API that ROBLOX Doesn't have or not register.
> - :GetModelDistance(Model: Instance) << First Parameter can be Model or can be parts. <br>
> - :IsModelOnScreen(Model: Instance) << First Parameter can be Model or can be parts. <br> 
> - :ZoomToModelExtents(Model: Model) << First Parameter must be model only can't be something else.<br>
> - :IsFirstperson() << Return Boolean <br>
> - :IsPlayerFirstperson(Player: Player) << First Parameter must be Player and Output is Boolean <br>
> Model <br>
> - :BulkSetCollisionGroup(Model: Model, CollisionGroup: String, ThroughDescendants: Boolean) << First Parameter is Container and Second Parameter is CollisionGroup Name that you register by PhysicsService, ThroughDescendants is boolean, True and False, If True will apply to the part inside the part.<br><br>
>
> Thread <br>
> - .new() << Define Thread<br>
> - .new():Loop() << Set Define Thread Loop<br>
> - .new():Run() << Running the Define Thread<br>
> - .new():Stop() << Stopping the Define Thread<br>
