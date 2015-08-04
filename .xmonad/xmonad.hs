import System.IO
import XMonad
import XMonad.Actions.WindowGo
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig
import System.Exit

import qualified XMonad.StackSet as W

import XMonad.Util.WorkspaceCompare
import XMonad.Actions.CycleWS
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Config.Desktop (desktopLayoutModifiers)
import XMonad.Layout.Named
import XMonad.Util.NamedScratchpad
import XMonad.Hooks.EwmhDesktops

import XMonad.Layout.IndependentScreens
import XMonad.Layout.NoBorders (smartBorders)
import XMonad.Layout.Reflect (reflectHoriz)
import XMonad.Layout.PerWorkspace



myModMask = mod4Mask
myTerminal = "urxvt"
myBorderWidth = 2
-- myNumlockMask = mod2Mask
-- myWorkspaces = ["main", "www", "ooo", "chat", "vbox"] ++ map show [6..9]
-- myNormalBorderColor  = "#dddddd"
-- myFocusedBorderColor = "#ff0000"
-- myDefaultGaps   = [(16,0,0,0)]


-- Key bindings ----------------------------------------------------

myKeys = [ ("M-S-q", spawn "pygtk-shutdown")
         , ("M-M1-S-q", io (exitWith ExitSuccess))
         -- , ("C-t e", runOrRaise "emacs" (className =? "Emacs"))
         -- , ("C-t t", runOrRaise "urxvt" (className =? "URxvt"))
         , ("M-.", spawn "dmenu_run -hist ~/.dmenu_history")
         , ("M-,", spawn "slimlock")
         , ("M-S-,", sendMessage Shrink)
         , ("M-S-.", sendMessage Expand)
         , ("M-w", sendMessage (IncMasterN 1))
         , ("M-e", sendMessage (IncMasterN (-1)))

         , ("M-n", moveTo Next HiddenNonEmptyWS)
         , ("M-p", moveTo Prev HiddenNonEmptyWS)
         , ("M-S-n", do t <- findWorkspace getSortByIndex Next EmptyWS 1
                        (windows . W.shift) t
                        (windows . W.greedyView) t)
         , ("M-S-p", shiftTo Prev EmptyWS)
         , ("M-f", sendMessage $ Toggle FULL)

         , ("M-r", refresh)
         , ("M-S-r", do
              screenWorkspace 1 >>= flip whenJust (windows.W.view)
              (windows . W.greedyView) "2"
              screenWorkspace 0 >>= flip whenJust (windows.W.view)
              (windows . W.greedyView) "1")

         , ("M-g", spawn "killall dzen2")
         , ("<Print>", spawn "import -window root ~/picture/`date +%F-%H%M%S`.png")
         ]
         ++ -- (S-)M-h/lでスクリーン切り替え
         [((m ++ "M-" ++ [key]), screenWorkspace sc >>= flip whenJust (windows . f))
              | (key, sc) <- zip "hl" [0..]
              , (f, m) <- [(W.view, ""), (W.shift, "S-")]]
         -- ++ -- ポップアップ用のキー設定
         -- [ ("C-t m", namedScratchpadAction scratchpads "Rhythmbox")
         -- ]


-- Window rules ----------------------------------------------------

myManageHook :: ManageHook
myManageHook = composeAll
               [ className =? "Pygtk-shutdown" --> doFloat
               , className =? "volumeicon" --> doIgnore
               ]

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

myClickJustFocuses :: Bool
myClickJustFocuses = True


leftDisplayLayout = reflectHoriz $ desktopLayoutModifiers (named "V" tall ||| (named "H" $ Mirror tall))
rightDisplayLayout = desktopLayoutModifiers (named "V" tall ||| (named "H" $ Mirror tall))


-- Window rules ----------------------------------------------------

tall = Tall 1 (3/100) (1/2)

myLayout = avoidStruts $ smartBorders $
           onWorkspaces ["1", "3", "5", "7", "9"] leftDisplayLayout $
           rightDisplayLayout


-- Scratchpad ----------------------------------------------------

scratchpads = [
 NS "Rhythmbox" "rhythmbox" (className =? "Rhythmbox") defaultFloating
 ] where role = stringProperty "WM_WINDOW_ROLE"


-- Default config ----------------------------------------------------

main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ ewmh defaultConfig
             { modMask = myModMask
             , borderWidth = myBorderWidth
             , terminal = myTerminal
             , manageHook = manageDocks
                            <+> myManageHook
                            <+> manageHook defaultConfig
                            <+> namedScratchpadManageHook scratchpads
             , layoutHook = mkToggle1 FULL $ myLayout

             , logHook = dynamicLogWithPP $ xmobarPP
                         { ppOutput = hPutStrLn xmproc
                         , ppTitle = xmobarColor "green" "" . shorten 50
                         }
             , focusFollowsMouse = myFocusFollowsMouse
             , clickJustFocuses = myClickJustFocuses
             }
           `additionalKeysP` myKeys
