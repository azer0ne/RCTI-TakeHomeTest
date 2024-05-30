# RCTI+ Take Home Test
This application is a take-home test for RCTI+. It features two main pages: the Home page and the Favorite page. The app is built using SwiftUI and follows the MVVM architecture pattern. CoreData is utilized for saving user favorite videos to local storage.

## Features
- Home Page: Displays a list of videos that users can watch.
- Favorite Page: Shows videos that users have added to their favorites.
## Technologies Used
- SwiftUI: For building the user interface.
- MVVM (Model-View-ViewModel): Architecture pattern used to separate concerns and manage data flow.
- CoreData: For persistent local storage of favorite videos.
- AVKit: For video playback.
## App Structure
### Models
- Video: Represents the video data fetched from the API.
- FavoriteVideos: CoreData entity representing a favorite video.
### ViewModels
- VideoViewModel: Manages video data, fetches videos from the API, and handles adding favorite videos.
  - addToFavorite(id:vidTitle:): Adds a video to favorites.
- FavoriteViewModel: Manages video data, fetches video from the API with filter, and fetch favorite videos from CoreData.
  - fetchVideos(): Fetches video data from the API and local favorite videos from CoreData.
### Views
- HomeView: Displays a list of videos fetched from the API.
- FavoriteView: Displays a list of videos that the user has marked as favorite.
- VideoDetailView: Displays details of a selected video and allows users to add/remove it from favorites.
