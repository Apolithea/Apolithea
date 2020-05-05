# **Apolithea**![](https://i.imgur.com/VTengGz.png)


## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
**Apolithea** is a music therapy app. It matches users to music based on their current mood. This is to help with the physical, pyschological, and social well being of individuals.

### App Evaluation
- **Category:** Lifestyle/Music
- **Mobile:** **Apolithea** is an app primarily designed for mobile, though if used on other platforms, it may lose some features.
- **Story:** **Apolithea** will match the users current emotion(s) to playlist. The user will then be able to "vibe" to music that aligns with said emotion.
- **Market:** This app can used by all ages. 
- **Habit:** This app can be used whenever. In the moments where the user does not know what to listen to, but they know what mood they are in whether it be sad, happy, angry, etc., the app is just a convinent way to listen to music that currently matches the users current mood.
- **Scope:** We would first start by asking what kinds of music that person likes. Then, ask the users emotion and match said emotion to music within the ranges of the type of music the user likes. This gives the user a chance to discover music as well.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] * Be able to login or Register through Spotify
- [ ] * Create playlist based on mood
- [ ] * Playlist are saved

**Optional Nice-to-have Stories**

- [ ] * Implementation of IBM Watson AI to read user's mood based on user's input.

### 2. Screen Archetypes

* Login Screen
   * Option to login or register through Spotify

* Profile Screen
   * User's profile

* Song Screen
    * The Songs are displayed based on the users input of mood
   
* Music Screen   
   * Displays music that is currently playing 

### 3. Navigation
# 
**Tab Navigation** (Tab to Screen)

* Login
* Mood/Search Bar
* Song Screen

Optional:
* Settings tab
* Stats Tab

**Flow Navigation** (Screen to Screen)

* Forced Log-in -> If there is no login information of the user, they will have to register through Spotify.
* Mood Screen/Search Bar Screen -> Input current emotion

## Wireframe(s)
<img src="https://66.media.tumblr.com/1732678a7b6a6aa5350cc1a2786b2ad1/e92a953d5e125735-44/s1280x1920/83a004fc17f628ac16ad60d5991915bc9da0e78c.jpg"><br>



| Property   | Type    | Description                      |
| ---------- | ------- | -------------------------------- |
| Bio        | String  | Information about user           |
| Mood       | String  | Information about the users mood |
| Name       | String  | Users name                       |
| like/save  | Boolean | Users likes song                 |
| dislike    | Boolean | Users dislikes song              |
| artistName           | pointer to user | Song artist name                                |
| albumCover | file    | Album cover of song              |
| bioImage   | file    | Image of uploaded picture        |

# **Networking**
**Existing API Endpoints**

* Base URL - https://api.spotify.com/v1/

| HTTP Verb | Endpoint | Description |
| --------- | -------- | ----------- |
|   GET        |    /tracks/{id}   |    returns track|
|  GET         |   /artist{id}       |  returns artist|
|  GET         |   /albums{id}       |  returns album           |

# **Progress GIFS**

![](https://i.imgur.com/Qp0REbj.gif)
![](https://i.imgur.com/cIiQSsw.gif)


# **Below is the Spotify API encrpyted token**
# <img src="https://66.media.tumblr.com/e86074874729c65967e504c9ee21cc4b/34cec652c08e664a-80/s1280x1920/66f1b4b1a2940a1b9e9cfdf36cf4abe2ec331fe6.png"><br>

# **Apolithea Revamp**

>In the middle of our project, we realized that we hit a massive roadblock implementing the Spotify API. Not only that, but the code process we had going was a mess and hard to build upon. We decided to restart the project entirely and redo some things.
> There was number of things we decided to focus on for this revamp:
1. > **Redo profile outlook on project**
- Reasoning for this is because we originally implemented parse to be able to have the user login. On our end, parse would randomly say it does not exist or cause confilct with other parts of our code. We figured we were making it more difficult for ourselves given the fact that the Spotify API makes you login anyway. We decided to have to user only login through their spotify.
2. > **Spotify API +Ultra Focus**
- The API is very difficult to work with. We decided to put undivided attention on getting it to at least implement it. We decided to dive deep and understand each area of the API, and luckily we were able to find frameworks and an outline of a good implementation on the Spotify Docs.
3. > **Watched Previous tutorials**
- We decided to watch the previous tutorials in CodePath's Courses to help us design the coding layout of our app. Something that we should've definetly done the first time, given that their tutorials had many things that help with the progress of the app. 
4. >**Song Screen**
- After implementing the Spotify enviroment and API, we shifted focus to the Song screen. This was important to finish as the previous work done was work we had already "done". We had to get something new done for the Sprint 3. We got it to return the songs after searching an artist, album, or song which is a CRAZY BIG win for us. Now all we have to do is forumalte the search result to search based of the users mood, which is supposed the be the core functionality of the app.
> 
# **New WireFrame**

![](https://i.imgur.com/6t67ftu.jpg)
Note: A little sloppy..yes... we just needed a rough wireframe to see how exactly we were going to design the project itself. Also I (Fabian Cooper) have bad handwriting.

# NEW Progress GIFS
![](https://i.imgur.com/C7PTmf7.gif)
![](https://i.imgur.com/TnqFQMz.gif)

# Mood Implementation

**There are three key values that we are focusing on for the mood implementation.**

**1. Valence**
**2. Energy**
**3. Danceability**

* **Valence** is a measure from 0.0 to 1.0 describing the musical positiveness conveyed by a track. Tracks with high valence sound more positive (e.g. happy, cheerful, euphoric), while tracks with low valence sound more negative (e.g. sad, depressed, angry).
* **Danceability** describes how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity. A value of 0.0 is least danceable and 1.0 is most danceable.
* **Energy** is a measure from 0.0 to 1.0 and represents a perceptual measure of intensity and activity. Typically, energetic tracks feel fast, loud, and noisy. For example, death metal has high energy, while a Bach prelude scores low on the scale. Perceptual features contributing to this attribute include dynamic range, perceived loudness, timbre, onset rate, and general entropy.

**Valence** was the primary attribute we focused on, as this directly correlates with the mood of a track. Based on the mood inputted, the program only adds tracks within a narrow range of that valence. Unfortuanetly, it is not as accurate as we had hoped it to be, so results can be funky sometimes depending on the artist or genre.

```
let valence = json["tracks"]["items"][index]["valence"].doubleValue
let dancibility = json["tracks"]["items"][index]["danceability"].doubleValue
let energy = json["tracks"]["items"][index]["energy"].doubleValue
```

Above, you can see that we are bringing it in. All we have to do know is match the valence of a song to an emotion. Due to time shortage, we may have to dummy some values or hard code to showcase the actual main function!


![](https://i.imgur.com/6NYrFhA.gif)

# Successful Mood Implementation!

We were able to successfully implement searching for the song based off the user's mood. This was done by matchinf the comapring the songs **Valence** (whether a song is happy or sad ranging from 1.0, happy, to 0.0, sad).

``` for song in midSongArray{

                Alamofire.request("https://api.spotify.com/v1/audio-features/\(song.id)", headers: ["Authorization": "Bearer " + auth.session.accessToken]).responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        
                        let valence = json["valence"].floatValue
                        
                        if abs((valence * 100)-(self.mood * 100)) <= 10{
                            self.songArray.append(song)
                        }
                    
                    case .failure(_):
                        print("failed")
                    }
                    completed()
```

In the code above, it shows that after the user request on what music they are looking for; it will compare each song's **Valence** to the current mood of the user, afterwards returning the songs that fit their mood.

**Below you can see how the result vary based off where the moodometer is. We meant to add signifiers, but for reference, the lower the moodometer, the sadder the user and vice versa.**

![](https://i.imgur.com/Ee0NRM1.gif)

# Future Work

Despite us finishing the main feature of the app, it is clear that it is still far from complete. Unfortunatley we did not implement as much features as we wanted to. Though it will always be here for us to continue the apps progress.

**Just some things we want to add or improve on:**

**1. Increase accuracy of mood settings.
2. More Personalization
3. Create playlist of specific moods 
4. Able to share playlist, moods, etc.**

Note that the completion of this app is for pratical reasons. 

It was fun designing and making an simple mobile application. This is definetly something we can see ourselves doing again!
