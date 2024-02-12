# Imports
# Fortnite.com Imports
using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
# Verse.org Imports
using { /Verse.org/Simulation }
using { /Verse.org/Assets }
# UnrealEngine.com Imports
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }


#Main Module, Needs to be imported to use any PaperFND Features
PaperFN<public> := module:
    # Runs when the device is started in a running game
    
    @editable CreativeProp<public> : creative_prop_asset = DefaultCreativePropAsset
    
    DisablePlayerControls <public> (Player : player) : void =
        if(PlayerAG := agent[Player]):
            PlayerChar := PlayerAG.GetFortCharacter[] or Err("Should be unfailable")
            PlayerChar.PutInStasis(stasis_args{})

    EnablePlayerControls <public> (Player : player) : void =
        if(PlayerAG := agent[Player]):
            PlayerChar := PlayerAG.GetFortCharacter[] or Err("Should be unfailable")
            PlayerChar.ReleaseFromStasis()

    FNPlatformer<public> := module: # Special Features for platformer style Games/Experiences (Ex: Super Mario and Celeste)

        MoveLeft<public>(FNDPlayerProp : creative_prop, InputAction:input_trigger_device, Speed : float):void=
            block:
        
        MoveRight<public>(FNDPlayerProp : creative_prop, InputAction:input_trigger_device, Speed : float):void=
            block:

        FlipX<public>(FNDPlayerProp : creative_prop, Scale : float):void= # Flips the X axis of the Prop. Use Scale to set the scale of your prop 
            PropScale := FNDPlayerProp.GetTransform().Scale.X
            FlipSize := vector3{X:=Scale, Y:=PropScale, Z:=PropScale}
            Trans := transform {
                Translation := FNDPlayerProp.GetTransform().Translation, 
                Rotation := FNDPlayerProp.GetTransform().Rotation, 
                Scale := FlipSize }
                if (FNDPlayerProp.TeleportTo[Trans]) {}
                
        FlipY<public>(FNDPlayerProp : creative_prop, Scale : float):void= # Flips the Y axis of the Prop. Use Scale to set the scale of your prop
            PropScale := FNDPlayerProp.GetTransform().Scale.X
            FlipSize := vector3{X:=PropScale, Y:=Scale, Z:=PropScale}
            Trans := transform {
                Translation := FNDPlayerProp.GetTransform().Translation, 
                Rotation := FNDPlayerProp.GetTransform().Rotation, 
                Scale := FlipSize }
                if (FNDPlayerProp.TeleportTo[Trans]) {}

    FNTopdown<public> := module: # Special Features for Topdown style Games/Experiences (Ex: The Legend of Zelda and Mario & Luigi RPG)

        #Movement Features

        MoveLeft<public>(FNDPlayerProp : creative_prop, InputAction:input_trigger_device, Speed : float):void=
            InputAction.PressedEvent.Subscribe(DoMoveLeft)
            InputAction.ReleasedEvent.Subscribe(MoveLeftStop)


        DoMoveLeft(Agent:agent):void=
            
            spawn{ HandleMoveLeft() }

        HandleMoveLeft()<suspends>:void=
            block:
                
        MoveLeftStop(Agent:agent, InputHeldDuration:float):void=
            block:

        
        MoveRight<public>(FNDPlayerProp : creative_prop, InputAction:input_trigger_device, Speed : float, Material : material):void=
            block:

        MoveUp<public>(FNDPlayerProp : creative_prop, InputAction:input_trigger_device, Speed : float, Material : material):void=
            block:

        MoveDown<public>(FNDPlayerProp : creative_prop, InputAction:input_trigger_device, Speed : float, Material : material):void=
            block:


        #Flip Features. Use to mirror your player prop or any other prop you might want to flip
        
        FlipX<public>(FNDPlayerProp : creative_prop, Scale : float):void= # Flips the X axis of the Prop. Use Scale to set the scale of your prop 
            PropScaleY := FNDPlayerProp.GetTransform().Scale.Y
            PropScaleZ := FNDPlayerProp.GetTransform().Scale.Z
            FlipSize := vector3{X:=Scale, Y:=PropScaleY, Z:=PropScaleZ}
            Trans := transform {
                Translation := FNDPlayerProp.GetTransform().Translation, 
                Rotation := FNDPlayerProp.GetTransform().Rotation, 
                Scale := FlipSize }
                if (FNDPlayerProp.TeleportTo[Trans]) {}
        
        FlipY<public>(FNDPlayerProp : creative_prop, Scale : float):void= # Flips the Y axis of the Prop. Use Scale to set the scale of your prop
            PropScaleX := FNDPlayerProp.GetTransform().Scale.X
            PropScaleZ := FNDPlayerProp.GetTransform().Scale.Z
            FlipSize := vector3{X:=PropScaleX, Y:=Scale, Z:=PropScaleZ}
            Trans := transform {
                Translation := FNDPlayerProp.GetTransform().Translation, 
                Rotation := FNDPlayerProp.GetTransform().Rotation, 
                Scale := FlipSize }
                if (FNDPlayerProp.TeleportTo[Trans]) {}

        FlipZ<public>(FNDPlayerProp : creative_prop, Scale : float):void= # Flips the Z axis of the Prop. Use Scale to set the scale of your prop 
            PropScaleX := FNDPlayerProp.GetTransform().Scale.X
            PropScaleY := FNDPlayerProp.GetTransform().Scale.Y
            FlipSize := vector3{X:=PropScaleX, Y:=PropScaleY, Z:=Scale}
            Trans := transform {
                Translation := FNDPlayerProp.GetTransform().Translation, 
                Rotation := FNDPlayerProp.GetTransform().Rotation, 
                Scale := FlipSize }
                if (FNDPlayerProp.TeleportTo[Trans]) {}

            

        FNTopdownShooter<public>  := module: # Special Features for Topdown Shooters style Games/Experiences (Ex: Vampire Survivors and The Binding of Isaac )

