package  
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.net.URLRequest;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Angela Gabriela
	 */
	public class Contenedor extends Sprite 
	{
		public static var CARGADO:String = "cargado";
		private var _clip:Sprite = new Sprite();
		private var _cargado:Boolean = false;
		private var _content:Sprite;
		private var _urlAsset:String;
		
		public function Contenedor(asset:String = null) 
		{
			_urlAsset = asset;
			
			if (_urlAsset != null) 
			{
				iniLoad();
			}
		}
		
		private function iniLoad(asset:String = null):void
		{
			var loader:Loader = new Loader();
            var request:URLRequest = new URLRequest(_urlAsset);
            loader.load(request);
            var dispatcher:EventDispatcher = loader.contentLoaderInfo;
            dispatcher.addEventListener(Event.INIT, registraContenido);
            addChild(loader);
		}
		
		public function set asset(a:String):void
        {
            if (_urlAsset != null) {
                removeChild(_clip);
            }
            _urlAsset = a;
            iniLoad();
        }

		public function get clip():Sprite
        {
            return _clip;
        }
		
        public function get cargado():Boolean
        {
            return _cargado;
        }
		
        public function registraContenido(e:Event):void
        {
            _cargado = true;
            _clip = e.target.content;
            dispatchEvent(new Event(Contenedor.CARGADO));
		}
	}

}