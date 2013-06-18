package 
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.TextField;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	/**
	 * ...
	 * @author Angela Gabriela
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// entry point
			var res: AssetsLoader = new AssetsLoader();
			res.loadFrom("ui/mostrador.swf");
			res.addEventListener(AssetsLoader.ASSETSLOADED, assetsLoaded);
			
			/*var text:TextField = new TextField();
			text.text = "HelloWorld";
			text.x = (stage.stageWidth - text.textWidth) / 2;
			text.y = (stage.stageHeight - text.textHeight) / 2;
			
			addChild(text);*/
			
			
		}
		
		private function assetsLoaded(e:Event):void
		{
			var cls:Class = AssetsLoader.clases["background"];
			addChild(new cls());
			
			cls = AssetsLoader.clases["btn_print"];
			addChild(new cls());
		}
		
		function listo(e:Event):void
		{
			trace("listo");
		}
		
		private function deactivate(e:Event):void 
		{
			// auto-close
			NativeApplication.nativeApplication.exit();
		}
		
	}
	
}