extends RichTextLabel

var nameArr = ["Asher", "Avery", "Aiden", "Aria", "Angel", "Adrian", "Atlas", "Addison", "Amari", "Archer",
"Alaia", "Aubrey", "Ashley", "Ashton", "Arya", "Alex", "Ayden", "Ariel", "Andrea", "Aspen", "Ari", "Armani",
"Aly", "Arbor", "Atlee", "Azure", "Arlyn", "Aviv", "Afton", "Aero", "Avalee", "Arvy", "Almarine", "Antalya", "Antigone"]

var aboutMeArr = ["I’m a little silly sometimes", "Looking for my next bad decision", "Do you like water? Then you already like 70% of me. :)",
"According to Newton’s law of gravitation, all masses in the universe attract. Therefore you and I are already attracted ;)",
"Times new roman in the streets, wingdings in the sheets",
"Looking for a friend to perform sacrificial goat rituals with.",
"My mom says I’m really mature for my age",
"I love my dog more than I’ll ever love you. Know your place",
"Super hyped to be on tinder! Thank you to my parents who are very supportive of my endevours to meet strangers, my friends who helped me set this all up, and finally to my ex, without whom none of this could have been possible.", 
"I enjoy playing the fortinitght too", "Yum yum taste of fleshie", 
"Looking for someone trusting and healthy. Both kidneys MUST be intact with no previous medical conditions. Also someone with a penchant for exploring dark alleyways and remote mountaintops.",
"Minimum requirement: Must be able to get rid of spiders",
"Never gonna give you up, never gonna let you down. No. Seriously. I won’t"
]

var zodiacArr = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn",
"Aquarius", "Pisces", "Rat", "Bull", "Tiger", "Rabbit", "Dragon", "Dog", "Pig", "Snake", "Sheep", "Roster", "Monkey",
"Horse", "Cat", "ENFP","ENFJ", "ENTP", "ENTJ", "ESFP", "ESTP", "ESFJ", "ESTJ", "INFP", "INFJ", "INTP","INTJ", "ISFP",
"ISTP", "ISFJ", "ISTJ"]

var randNameInt = randi_range(0, len(nameArr))
var randAboutMeInt = randi_range(0, len(aboutMeArr))
var randZodiacInt = randi_range(0, len(zodiacArr))
func _ready():
	push_font_size(25)
	append_name_line("Name", nameArr[randNameInt])
	append_text("[b][color=black] %s[/color][/b]\n" % [aboutMeArr[randAboutMeInt]])
	append_profile_line("Zodiac", zodiacArr[randZodiacInt])
	append_chat_line_escaped("Player 2", "Hello [color=red]BBCode injection[/color] (with escaping)!")


# Returns escaped BBCode that won't be parsed by RichTextLabel as tags.
func escape_bbcode(bbcode_text):
	# We only need to replace opening brackets to prevent tags from being parsed.
	return bbcode_text.replace("[", "[lb]")


# Appends the user's message as-is, without escaping. This is dangerous!
func append_name_line(username, message):
	append_text("[b][color=black]%s: %s[/color][/b]\n" % [username, message])
	
func append_profile_line(username, message):
	append_text("[color=black]%s: %s[/color]\n" % [username, message])


# Appends the user's message with escaping.
# Remember to escape both the player name and message contents.
func append_chat_line_escaped(username, message):
	append_text("%s: [color=green]%s[/color]\n" % [escape_bbcode(username), escape_bbcode(message)])
