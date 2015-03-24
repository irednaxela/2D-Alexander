package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Alex
	 */
	public class Main extends Sprite 
	{
		private var monster:Sprite;
		private var left:Boolean;
		private var right:Boolean;
		private var speed:Number = 0;
		private var aceleration:Number = 0.2;
		private var maxSpeed:Number =2;
		private var friccion:Number = 0.99;
		private var current:int;
		private var elapsed:Number=0;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			DLoader.load("assets.swf",goGame);
		}
		private function goGame():void
		{
			
			monster = new Monster();
			addChild(monster);
			current = getTimer();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onUp)
			stage.addEventListener(Event.ENTER_FRAME, loop);
			var timer:Timer = new Timer(500);
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, onTime);
		}
		
		private function onTime(e:TimerEvent):void 
		{
			var m:Monster2 = new Monster2();
			addChild(m);
			m.x = Math.random() * stage.stageWidth;
		}
		
		private function loop(e:Event):void 
		{
			var dt:Number = (getTimer() - current)*0.001;
			current = getTimer();
			elapsed += dt;
			trace(elapsed);
			
			if (left)
			{
				speed -= aceleration;
				if (speed < -maxSpeed) 
				{
					speed = -maxSpeed;
				}
			}
			if (right)
			{
				speed += aceleration;
				if (speed > maxSpeed)
				{
					speed = maxSpeed;
				}
			}
			speed *= friccion;
			monster.x += speed;
		}
		
		private function onUp(e:KeyboardEvent):void 
		{

			switch(e.keyCode)
			{
				case Keyboard.A:
				left = false;
				break;
				case Keyboard.D:
				right = false;
				break;
			}
		}
		
		private function onDown(e:KeyboardEvent):void 
		{

			switch(e.keyCode)
			{
				case Keyboard.A:
				left = true;
				break;
				case Keyboard.D:
				right = true;
				break;
			}
		}
		
	}
	
}