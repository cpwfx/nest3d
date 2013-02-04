package nest.control.controller 
{
	import flash.utils.getTimer;
	
	import nest.control.animation.AnimationTrack;
	import nest.control.animation.IAnimatable;
	
	/**
	 * AnimationController
	 * <p>The time value in this Controller is used to calculate all IAnimatable object's AnimationTracks.</p>
	 */
	public class AnimationController {
		
		private var _time:Number = 0;
		
		private var last:int = 0;
		private var count:int = 0;
		
		public var objects:Vector.<IAnimatable> = new Vector.<IAnimatable>();
		public var paused:Boolean = true;
		public var speed:Number = 1;
		public var loops:int = 0;
		
		public function AnimationController() {
			
		}
		
		public function calculate():void {
			if (paused) return;
			
			var ct:int = getTimer();
			var dt:Number = (ct - last) / 1000;
			
			last = ct;
			_time += dt * speed;
			
			if (_time > length) {
				_time = 0;
				count++;
				if (count >= loops) paused = true;
			}
			
			var object:IAnimatable;
			var track:AnimationTrack;
			for each(object in objects) {
				if (!object.tracks) continue;
				for each(track in object.tracks) {
					if (track.length > 0 && _time >= track.start && _time < track.start + track.length) {
						track.modifier.calculate(object, track.first, _time - track.start);
					}
				}
			}
		}
		
		public function restart():void {
			paused = false;
			count = 0;
			last = getTimer();
		}
		
		///////////////////////////////////
		// getter/setters
		///////////////////////////////////
		
		public function get time():Number {
			return _time;
		}
		
		public function set time(value:Number):void {
			_time = value;
			last = getTimer();
		}
		
		public function get length():Number {
			var i:Number = 0;
			var object:IAnimatable;
			var track:AnimationTrack;
			for each(object in objects) {
				if (!object.tracks) continue;
				for each(track in object.tracks) {
					if (track.length + track.start > i) i = track.length + track.start;
				}
			}
			return i;
		}
		
	}

}