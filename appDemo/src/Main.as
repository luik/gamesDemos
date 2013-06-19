package 
{
	import flash.desktop.NativeApplication;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.TextField;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import Loader.AssetsLoader;
		
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
			AssetsLoader.current = new AssetsLoader();
			AssetsLoader.current.addEventListener(AssetsLoader.ASSETSLOADED, assetsLoaded);
			AssetsLoader.current.loadFrom("ui/mostrador.swf");
		}
		
		private function assetsLoaded(e:Event):void
		{
			var cls:DisplayObject = AssetsLoader.current.getComponentByName("background");
			addChild(cls);
			
			cls = AssetsLoader.current.getComponentByName("btn_print");
			addChild(cls);			
		}
		
		private function deactivate(e:Event):void 
		{
			// auto-close
			NativeApplication.nativeApplication.exit();
		}
		
	}
	
}