package app.services{	import app.events.fb.FBConnectEvent;	import com.facebook.Facebook;	import com.facebook.commands.photos.GetAlbums;	import com.facebook.commands.photos.GetPhotos;	import com.facebook.commands.users.GetInfo;	import com.facebook.data.photos.GetAlbumsData;	import com.facebook.data.photos.GetPhotosData;	import com.facebook.data.users.FacebookUser;	import com.facebook.data.users.GetInfoData;	import com.facebook.data.users.GetInfoFieldValues;	import com.facebook.events.FacebookEvent;	import com.facebook.net.FacebookCall;	import com.facebook.utils.FacebookSessionUtil;	import org.robotlegs.mvcs.Actor;	import mx.collections.ArrayCollection;	import flash.display.Stage;	/**	 * @author marco link (m.link@gmx.de)	 */	public class FacebookService extends Actor	{		/*******************************************************************************************		*								public properties										   *		*******************************************************************************************/		[Inject] public var stage : Stage;				public static const API_KEY : String = '9ac6c954fe46ff779aaa81f1875f1fab';		public static const SECRET_KEY : String = '403b82e7b616c3f571ddbdfa4a98b401';
						/*******************************************************************************************		*								protected/ private properties							   *		*******************************************************************************************/		private var m_session : FacebookSessionUtil;
		private var m_facebook : Facebook;
		private var m_user : FacebookUser;		private var m_facebookPhotoAlbums : ArrayCollection;
		private var m_facebookPhotos : ArrayCollection;
				/*******************************************************************************************		*								public methods											   *		*******************************************************************************************/		public function FacebookService()		{					}
		public function login() : void		{			if(!m_session)			{				initService();			}			m_session.login();		}				public function validateLogin() : void		{			if(!m_session)			{				initService();			}        	m_session.validateLogin();		}				public function loadPhotosByAlbum(albumId : String) : void		{			var call:FacebookCall = m_facebook.post(new GetPhotos('', albumId));			call.addEventListener(FacebookEvent.COMPLETE, handleGetPhotosResponse);		}				public function getUserData() : FacebookUser		{			return m_user;		}				/*******************************************************************************************		*								protected/ private methods								   *		*******************************************************************************************/		protected function initService() : void 		{			m_session = new FacebookSessionUtil(API_KEY, SECRET_KEY, stage.loaderInfo);			m_session.addEventListener(FacebookEvent.CONNECT, login_connect);			m_facebook = m_session.facebook;
		}				private function login_connect(event : FacebookEvent) : void 		{						if(!event.success)			{//				throw new Error('e FB.login failed');				return;				}			var call:FacebookCall = m_facebook.post(new GetInfo([m_facebook.uid], 				[GetInfoFieldValues.ALL_VALUES]));
			call.addEventListener(FacebookEvent.COMPLETE, login_info);		}				private function login_info(e:FacebookEvent):void		{			m_user = (e.data as GetInfoData).userCollection.getItemAt(0) as FacebookUser;			dispatch(new FBConnectEvent(FBConnectEvent.FB_CONNECT_SUCCESS));		}		private function getPhotoAlbums():void		 {			var call:FacebookCall = m_facebook.post(new GetAlbums(m_facebook.uid));			call.addEventListener(FacebookEvent.COMPLETE, handleGetAlbumsResponse);		}			private function handleGetAlbumsResponse(e:FacebookEvent):void 		{			var albumsResponseData:GetAlbumsData = e.data as GetAlbumsData;			if (!albumsResponseData || e.error){ // an error occurred				return;			}			m_facebookPhotoAlbums = new ArrayCollection();																				for(var i:int = 0; i < albumsResponseData.albumCollection.length; i++)			{				m_facebookPhotoAlbums.addItem(albumsResponseData.albumCollection.getItemAt(i));				}		}				private function handleGetPhotosResponse(e:FacebookEvent):void 		{			var photosResponseData:GetPhotosData = e.data as GetPhotosData;			if (!photosResponseData || e.error){ // an error occurred				return;			}							m_facebookPhotos = new ArrayCollection();			for(var i:int = 0; i < photosResponseData.photoCollection.length; i++)			{				m_facebookPhotos.addItem(photosResponseData.photoCollection.getItemAt(i));				}		}		//		private function showSelectedAlbum():void //		{//			var selectedAlbumID:String = albumsDataGrid.selectedItem.aid;//							//		//		}		}}