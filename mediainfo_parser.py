from pymediainfo import MediaInfo

def get_mediainfo_data(filename):
    general_data = {}
    video_data = {}
    audio_data = {}
    image_data = {}
    menu_data = {}
    text_data = {}
    other_data = {}
    if filename:
        mediainfo = MediaInfo.parse(filename, full=False)
        for track in mediainfo.tracks:
            match track.track_type:
                case "General":
                    general_data = mediainfo.general_tracks[0].to_data()
                case "Audio":
                    audio_data = mediainfo.audio_tracks[0].to_data()
                case "Video":
                    video_data = mediainfo.video_tracks[0].to_data()
                case "Image":
                    image_data = mediainfo.image_tracks[0].to_data()
                case "Menu":
                    menu_data = mediainfo.menu_tracks[0].to_data()
                case "Text": #not tested, do not have mediafiles with this
                    text_data = mediainfo.text_tracks[0].to_data()
                case "Other":
                    other_data = mediainfo.other_tracks[0].to_data()

    return {
        "general": general_data,
        "video": video_data,
        "audio": audio_data,
        "image": image_data,
        "menu": menu_data,
        "text": text_data,
        "other": other_data
        }
