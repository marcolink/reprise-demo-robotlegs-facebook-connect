package app.events.fb{	import flash.events.Event;
	/**	 * @author marco link (m.link@gmx.de)	 */	public class FBConnectEvent extends Event	{		/*******************************************************************************************		*								public properties										   *		*******************************************************************************************/		public static const FB_CONNECT : String = 'facebookConnectEvent';		public static const FB_CONNECT_SUCCESS : String = 'facebookConnectSuccessEvent';
		public static const FB_VALIDATE_LOGIN : String = 'facebookConnectValidateLoginEvent';
				/*******************************************************************************************		*								protected/ private properties							   *		*******************************************************************************************/						/*******************************************************************************************		*								public methods											   *		*******************************************************************************************/		public function FBConnectEvent(type : String)		{			super(type);		}				override public function clone() : Event		{			return new FBConnectEvent(this.type);		}						/*******************************************************************************************		*								protected/ private methods								   *		*******************************************************************************************/	}}