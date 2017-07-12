module Simula.NewCompositor.Compositor where

import Control.Concurrent.MVar
import Foreign

import Simula.WaylandServer

import {-# SOURCE #-} Simula.NewCompositor.SceneGraph
import Simula.NewCompositor.OpenGL
import Simula.NewCompositor.Types
import Simula.NewCompositor.Wayland.Input
import Simula.NewCompositor.Wayland.Output


data CompositorType = QtWayland | OsvrQtWayland

class Compositor a where
  startCompositor :: a -> IO ()

  compositorOpenGLContext :: a -> IO (Some OpenGLContext)
  compositorSeat :: a -> IO (Some Seat)

  compositorDisplay :: a -> IO Display

  compositorWlDisplay :: a -> WlDisplay

  compositorGetSurfaceFromResource :: a -> WlResource -> IO (Some WaylandSurface)