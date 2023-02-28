package model

type TMDb struct {
	Adult               bool   `json:"Adult"`
	BackdropPath        string `json:"backdrop_path"`
	BelongsToCollection struct {
		ID           int    `json:"ID"`
		Name         string `json:"Name"`
		PosterPath   string `json:"poster_path"`
		BackdropPath string `json:"backdrop_path"`
	} `json:"belongs_to_collection"`
	Budget int `json:"Budget"`
	Genres []struct {
		ID   int    `json:"ID"`
		Name string `json:"Name"`
	} `json:"Genres"`
	Homepage            string  `json:"Homepage"`
	ID                  int     `json:"ID"`
	ImdbID              string  `json:"imdb_id"`
	OriginalLanguage    string  `json:"original_language"`
	OriginalTitle       string  `json:"original_title"`
	Overview            string  `json:"Overview"`
	Popularity          float64 `json:"Popularity"`
	PosterPath          string  `json:"poster_path"`
	ProductionCompanies []struct {
		ID            int    `json:"ID"`
		Name          string `json:"Name"`
		LogoPath      string `json:"logo_path"`
		OriginCountry string `json:"origin_country"`
	} `json:"production_companies"`
	ProductionCountries []struct {
		Iso31661 string `json:"iso_3166_1"`
		Name     string `json:"Name"`
	} `json:"production_countries"`
	ReleaseDate     string `json:"release_date"`
	Revenue         int    `json:"Revenue"`
	Runtime         int    `json:"Runtime"`
	SpokenLanguages []struct {
		Iso6391 string `json:"iso_639_1"`
		Name    string `json:"Name"`
	} `json:"spoken_languages"`
	Status      string  `json:"Status"`
	Tagline     string  `json:"Tagline"`
	Title       string  `json:"Title"`
	Video       bool    `json:"Video"`
	VoteAverage float64 `json:"vote_average"`
	VoteCount   int     `json:"vote_count"`
}
