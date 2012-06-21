package nest.object.geom
{
	import flash.geom.Vector3D;
	
	/**
	 * Triangle
	 */
	public class Triangle {
		
		public var index0:uint;
		public var index1:uint;
		public var index2:uint;
		
		public var u0:Number;
		public var u1:Number;
		public var u2:Number;
		public var v0:Number;
		public var v1:Number;
		public var v2:Number;
		
		public var normal:Vector3D;
		
		public function Triangle(index0:uint = 0, index1:uint = 0, index2:uint = 0) {
			this.index0 = index0;
			this.index1 = index1;
			this.index2 = index2;
			normal = new Vector3D();
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		public function toString():String {
			return "[nest.object.geom.Triangle]";
		}
		
	}

}