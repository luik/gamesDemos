package  
{
	/**
	 * ...
	 * @author Angela Gabriela
	 */
	
	 import flash.events.Event;
	 import flash.display.Loader;
	 import flash.display.LoaderInfo;
	 import flash.events.EventDispatcher;
	 import flash.net.URLRequest;
	
	public class AssetsLoader extends EventDispatcher
	{
		public static var clases:Array;
		public static const ASSETSLOADED:String = "assetsLoaded";
		
		public function loadFrom(asset:String):void
		{
			clases = [];
			var loader:Loader = new Loader();			
			loader.load(new URLRequest(asset));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandle);
		}
		
		public function completeHandle(e:Event):void
		{
			clases["background"] = (e.target as LoaderInfo).loader.contentLoaderInfo.applicationDomain.getDefinition("background");
			clases["btn_print"] = (e.target as LoaderInfo).loader.contentLoaderInfo.applicationDomain.getDefinition("btn_print");
			
			dispatchEvent(new Event(ASSETSLOADED));
		}
	}

}