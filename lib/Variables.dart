Map initialArray;

Map categoryArray;

String initialCat = '''
{
	"Categories": [{
		"Name": "space",
		"url": "https://images.pexels.com/photos/220201/pexels-photo-220201.jpeg?cs=srgb&dl=astronomy-atmosphere-earth-exploration-220201.jpg&fm=jpg"
	}, {
		"Name": "water",
		"url": "https://images.pexels.com/photos/62307/air-bubbles-diving-underwater-blow-62307.jpeg?cs=srgb&dl=sea-water-blue-sun-62307.jpg&fm=jpg"
	}, {
		"Name": "animals",
		"url": "https://images.pexels.com/photos/247502/pexels-photo-247502.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "nature",
		"url": "https://images.pexels.com/photos/3573351/pexels-photo-3573351.png?cs=srgb&dl=trees-during-day-3573351.jpg&fm=jpg"
	}, {
		"Name": "science",
		"url": "https://images.pexels.com/photos/256262/pexels-photo-256262.jpeg?cs=srgb&dl=close-up-of-microscope-256262.jpg&fm=jpg"
	}, {
		"Name": "art",
		"url": "https://images.pexels.com/photos/161154/stained-glass-spiral-circle-pattern-161154.jpeg?cs=srgb&dl=worms-eye-view-of-spiral-stained-glass-decors-through-the-161154.jpg&fm=jpg"
	}, {
		"Name": "cartoon",
		"url": "https://images.pexels.com/photos/42415/pexels-photo-42415.jpeg?cs=srgb&dl=animation-cartoon-cartoon-character-disney-42415.jpg&fm=jpg"
	}, {
		"Name": "abstract",
		"url": "https://images.pexels.com/photos/2505693/pexels-photo-2505693.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "adventure",
		"url": "https://images.pexels.com/photos/1576937/pexels-photo-1576937.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "architectural",
		"url": "https://images.pexels.com/photos/3290068/pexels-photo-3290068.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "Black And White",
		"url": "https://images.pexels.com/photos/57905/pexels-photo-57905.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
	}, {
		"Name": "candid",
		"url": "https://images.pexels.com/photos/937453/pexels-photo-937453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "cityscape",
		"url": "https://images.pexels.com/photos/1034662/pexels-photo-1034662.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "commercial",
		"url": "https://images.pexels.com/photos/998499/pexels-photo-998499.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
	}, {
		"Name": "composite",
		"url": "https://images.pexels.com/photos/3975575/pexels-photo-3975575.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "creative",
		"url": "https://images.pexels.com/photos/1274260/pexels-photo-1274260.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "drone",
		"url": "https://images.pexels.com/photos/931018/pexels-photo-931018.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "Double Exposure",
		"url": "https://images.pexels.com/photos/1671030/pexels-photo-1671030.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "event",
		"url": "https://images.pexels.com/photos/382297/pexels-photo-382297.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
	}, {
		"Name": "family",
		"url": "https://images.pexels.com/photos/377058/pexels-photo-377058.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "Fashion",
		"url": "https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "film",
		"url": "https://images.pexels.com/photos/918281/pexels-photo-918281.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "Fine Art",
		"url": "https://images.pexels.com/photos/1463924/pexels-photo-1463924.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "food",
		"url": "https://images.pexels.com/photos/277253/pexels-photo-277253.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "golden hour",
		"url": "https://images.pexels.com/photos/1212600/pexels-photo-1212600.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "holiday",
		"url": "https://images.pexels.com/photos/1371360/pexels-photo-1371360.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "indoor",
		"url": "https://images.pexels.com/photos/1819668/pexels-photo-1819668.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "infrared",
		"url": "https://images.pexels.com/photos/2220/red-sun-purple-dream.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "landscape",
		"url": "https://images.pexels.com/photos/414171/pexels-photo-414171.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}, {
		"Name": "Lifestyle",
		"url": "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
	}, {
		"Name": "Long Exposure",
		"url": "https://images.pexels.com/photos/1820563/pexels-photo-1820563.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
	}]
}
''';

Map categoryPhotos;
