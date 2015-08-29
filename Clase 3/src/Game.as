package 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.AssetManager;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author 
	 */
	public class Game extends Sprite 
	{
		private var timer:Timer;
		
		
		
		public function Game() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			
		}
		private function onAdded(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		public function start():void
		{
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			var bg:Image = new Image(DStarling.assetsManager.getTexture("scene1"));
			addChild(bg);
			stage.addEventListener(TouchEvent.TOUCH, onTouch);
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			if (timer.currentCount % 3 == 0 ) 
			{
				var nc:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("walk00"));
			addChild(nc);
			nc.x = Math.random() * stage.stageWidth;
			nc.y = Math.random() * stage.stageHeight;
			Starling.juggler.add(nc);
			nc.name = "green";
			}
			
			else{
				var sc:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("coin"));
			addChild(sc);
			sc.x = Math.random() * stage.stageWidth;
			sc.y = Math.random() * stage.stageHeight;
			sc.name = "coin";
			}
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			//var nc:MovieClip = e.currentTarget as MovieClip;
			var touch:Touch = e.getTouch(this);
			if (touch != null) 
			{
				if (touch.phase == TouchPhase.BEGAN) 
				{
					trace("hizo click");
					var content:DisplayObject = e.target as DisplayObject;
					if (content.name == "coin" || content.name == "green") 
					{
						removeChild(content);
					}
					//removeChild(nc);
					//Starling.juggler.remove(nc);
					//nc.removeEventListener(TouchEvent.TOUCH, onTouch);
				}
				
			}
		}
	}

}