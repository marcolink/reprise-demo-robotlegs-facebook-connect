package app.models.fb{	import com.facebook.data.users.FacebookUser;
	/**	 * @author marco link (m.link@gmx.de)	 */	public class FBModel 	{
		/*******************************************************************************************		*								public properties										   *		*******************************************************************************************/						/*******************************************************************************************		*								protected/ private properties							   *		*******************************************************************************************/		private var m_userLoggedIn : Boolean;		private var m_userData : FacebookUser;
				/*******************************************************************************************		*								public methods											   *		*******************************************************************************************/		public function FBModel()		{			initialize();			}
		public function setUserLoggedIn(loggedIn : Boolean) : void		{			m_userLoggedIn = loggedIn;			}				public function getUserLoggedIn() : Boolean		{			return m_userLoggedIn;		}		public function setUserData(userData : FacebookUser) : void		{			m_userData = userData;			}				public function getUserData() : FacebookUser		{			return m_userData;		}		/*******************************************************************************************		*								protected/ private methods								   *		*******************************************************************************************/		private function initialize() : void 		{			m_userLoggedIn = false;		}	}}