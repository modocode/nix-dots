{
  lib,
  config,
  pkgs,
  ...
}:

let
  xmonadConfig = ''
    import XMonad
    import XMonad.Util.EZConfig (additionalKeysP)
    import XMonad.Layout.Spacing

    myLayoutHook = spacingWithEdge 3 $ layoutHook def

    myKeys =
        [ ("M-<Return>", spawn "alacritty")
        , ("M-d", spawn "dmenu_run")
        , ("M-q", kill)
        , ("M-S-r", spawn "xmonad --recompile && xmonad --restart")
        ]
    main = xmonad $ def
        { modMask = mod4Mask      -- Use Super instead of Alt
        , terminal = "alacritty"  -- Use alacritty as terminal
        ,borderWidth = 2
        , normalBorderColor = "#444b6a"
        , focusedBorderColor = "#ad8ee6"
        , layoutHook = myLayoutHook
        }
        `additionalKeysP` myKeys
  '';
in
{
  #services.xserver.windowManager.xmonad.config = xmonadConfig;
}
