package Loader 
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.DataLoader;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.SWFLoader;
	import com.greensock.loading.XMLLoader;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Angela Gabriela
	 */
	public class SWCLoader 
	{
		var queue:LoaderMax = new LoaderMax( { name:"mainQueue", onProgress:progressHandler, onComplete:completeHandler, onError:errorHandler } );
		
		public function SWCLoader() 
		{
			
		}
		
		public function loadFrom(asset:String):void
		{
			queue.append(new SWFLoader(asset));
			/*
			var swcLoader:URLLoader = new URLLoader(new URLRequest(asset));
			swcLoader.dataFormat = URLLoaderDataFormat.BINARY;
			swcLoader.addEventListener(Event.COMPLETE, swcLoaded);*/
			queue.load();
		}
		
		function progressHandler(evt:LoaderEvent):void
		{
			trace("progress: " + evt.target.progress);
		}
		
		function completeHandler(evt:LoaderEvent):void
		{
			trace("Asset cargado");
		}
		
		function errorHandler(evt:LoaderEvent):void
		{
			trace("ocurrio un error");
		}
		
		private function swcLoaded(evt:Event):void
		{
			trace("Loaded desde swf");
		}		
	}

}