package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Alex
	 */
	public class Monster extends Sprite 
	{
		private var skin:Sprite;
		
		public function Monster() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
			skin = new Sprite();
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Class = DLoader.getAsset("sona");
			skin = new c();
			addChild(skin);
		}
		
	}

}