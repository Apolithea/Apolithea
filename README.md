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



