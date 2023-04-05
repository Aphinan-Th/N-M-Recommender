// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse and unparse this JSON data, add this code to your project and do:
//
//    newyorkTime, err := UnmarshalNewyorkTime(bytes)
//    bytes, err = newyorkTime.Marshal()

package model

import "encoding/json"

func UnmarshalNewyorkTime(data []byte) (NewyorkTime, error) {
	var r NewyorkTime
	err := json.Unmarshal(data, &r)
	return r, err
}

func (r *NewyorkTime) Marshal() ([]byte, error) {
	return json.Marshal(r)
}

type NewyorkTime struct {
	Status     string   `json:"status"`
	Copyright  string   `json:"copyright"`
	NumResults int64    `json:"num_results"`
	Results    []Result `json:"results"`
}

type Result struct {
	URI           string      `json:"uri"`
	URL           string      `json:"url"`
	ID            int64       `json:"id"`
	AssetID       int64       `json:"asset_id"`
	Source        Source      `json:"source"`
	PublishedDate string      `json:"published_date"`
	Updated       string      `json:"updated"`
	Section       string      `json:"section"`
	Subsection    string      `json:"subsection"`
	Nytdsection   string      `json:"nytdsection"`
	AdxKeywords   string      `json:"adx_keywords"`
	Column        interface{} `json:"column"`
	Byline        string      `json:"byline"`
	Type          ResultType  `json:"type"`
	Title         string      `json:"title"`
	Abstract      string      `json:"abstract"`
	DESFacet      []string    `json:"des_facet"`
	OrgFacet      []string    `json:"org_facet"`
	PerFacet      []string    `json:"per_facet"`
	GeoFacet      []string    `json:"geo_facet"`
	Media         []Media     `json:"media"`
	EtaID         int64       `json:"eta_id"`
}

type Media struct {
	Type                   MediaType        `json:"type"`
	Subtype                Subtype          `json:"subtype"`
	Caption                string           `json:"caption"`
	Copyright              string           `json:"copyright"`
	ApprovedForSyndication int64            `json:"approved_for_syndication"`
	MediaMetadata          []MediaMetadatum `json:"media-metadata"`
}

type MediaMetadatum struct {
	URL    string `json:"url"`
	Format Format `json:"format"`
	Height int64  `json:"height"`
	Width  int64  `json:"width"`
}

type Format string

const (
	MediumThreeByTwo210 Format = "mediumThreeByTwo210"
	MediumThreeByTwo440 Format = "mediumThreeByTwo440"
	StandardThumbnail   Format = "Standard Thumbnail"
)

type Subtype string

const (
	Photo Subtype = "photo"
)

type MediaType string

const (
	Image MediaType = "image"
)

type Source string

const (
	NewYorkTimes Source = "New York Times"
)

type ResultType string

const (
	Article ResultType = "Article"
)
