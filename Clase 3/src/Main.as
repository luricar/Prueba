package
{
	

	import flash.display.Sprite;
	import flash.events.Event;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author
	 */
	[SWF(frameRate = 60, height = 600, width = 400) ]
	
	public class Main extends Sprite
	{
		
		public function Main()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var assets:Vector.<String> = new Vector.<String>();
			assets.push("assets/walkasdasdasds/scene1.png");
			assets.push("assets/walk/sprites.png");
			assets.push("assets/walk/coin.png");
			assets.push("assets/walk/sprites.xml");
			DStarling.init(Game, stage, assets, startGame);
		}
		private function startGame():void{

			
		}
	
	}

}