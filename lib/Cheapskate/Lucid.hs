module Cheapskate.Lucid
(
  renderDoc,
  renderBlocks,
  renderInlines,
)
where


import           Cheapskate
import qualified Cheapskate.Html as Cheapskate

import qualified Lucid.Base as Lucid

import qualified Text.Blaze.Html               as Blaze
import qualified Text.Blaze.Html.Renderer.Utf8 as Blaze


blazeToLucid :: Monad m => Blaze.Html -> Lucid.HtmlT m ()
blazeToLucid b = Lucid.HtmlT (return (const (Blaze.renderHtmlBuilder b), ()))
{-# INLINE blazeToLucid #-}

renderDoc :: Monad m => Doc -> Lucid.HtmlT m ()
renderDoc doc = blazeToLucid (Cheapskate.renderDoc doc)

renderBlocks :: Monad m => Options -> Blocks -> Lucid.HtmlT m ()
renderBlocks opts bs = blazeToLucid (Cheapskate.renderBlocks opts bs)

renderInlines :: Monad m => Options -> Inlines -> Lucid.HtmlT m ()
renderInlines opts is = blazeToLucid (Cheapskate.renderInlines opts is)
