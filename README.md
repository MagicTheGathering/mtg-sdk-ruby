# Magic: The Gathering SDK

[![mtg-developers on discord](https://img.shields.io/badge/discord-mtg%20developers-738bd7.svg)](https://discord.gg/qwGJNnP)
[![Gem Version](https://badge.fury.io/rb/mtg_sdk.svg)](https://badge.fury.io/rb/mtg_sdk) 
[![Build Status](https://travis-ci.org/MagicTheGathering/mtg-sdk-ruby.svg?branch=master)](https://travis-ci.org/MagicTheGathering/mtg-sdk-ruby)
[![Dependency Status](https://gemnasium.com/MagicTheGathering/mtg-sdk-ruby.svg)](https://gemnasium.com/MagicTheGathering/mtg-sdk-ruby)
[![Code Climate](https://codeclimate.com/github/MagicTheGathering/mtg-sdk-ruby/badges/gpa.svg)](https://codeclimate.com/github/MagicTheGathering/mtg-sdk-ruby)
[![Test Coverage](https://codeclimate.com/github/MagicTheGathering/mtg-sdk-ruby/badges/coverage.svg)](https://codeclimate.com/github/MagicTheGathering/mtg-sdk-ruby/coverage)

This is the Magic: The Gathering SDK Ruby implementation. It is a wrapper around the MTG API of [magicthegathering.io](http://magicthegathering.io/).

## Installation

Add this line to your application's Gemfile:

    gem 'mtg_sdk'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mtg_sdk

## Usage

To change the API version (currently defaults to version 1)

    MTG.configure do |config|
      config.api_version = 2
    end

### Classes

    Card
    Set
    ForeignName
    Ruling
    Legality
    Subtype
    Supertype
    Type
    Changelog

### Properties Per Class

#### Card

    name
    multiverse_id
    layout
    names
    mana_cost
    cmc
    colors
    color_identity
    type
    supertypes
    subtypes
    rarity
    text
    flavor
    artist
    number
    power
    toughness
    loyalty
    variations
    watermark
    border
    timeshifted
    hand
    life
    reserved
    release_date
    starter
    rulings
    foreign_names
    printings
    original_text
    original_type
    legalities
    source
    image_url
    set
    set_name
    id

#### Set

    code
    name
    gatherer_code
    old_code
    magic_cards_info_code
    release_date
    border
    type
    block
    online_only
    booster
    mkm_id
    mkm_name

#### ForeignName

    language
    name
    multiverse_id

#### Ruling

    date
    text

#### Legality

    format
    legality
    
#### Changelog

    version
    release_date
    details

### Functions Available

#### Find a card by multiverse id

    card = MTG::Card.find(386616)

#### Filter Cards via query parameters

    cards = MTG::Card.where(set: 'ktk').where(subtypes: 'warrior,human').all
    
#### Find all cards (will take awhile)

    cards = MTG::Card.all
    
#### Get all cards, but only a specific page of data

    cards = MTG::Card.where(page: 5).where(pageSize: 100).all
    
#### Find a set by code

    set = MTG::Set.find('ktk')
    
#### Filter sets via query parameters

    sets = MTG::Set.where(name: 'khans').all
    
#### Get all Sets

    sets = MTG::Set.all
    
#### Get all Types

    types = MTG::Type.all

#### Get all Subtypes

    subtypes = MTG::Subtype.all

#### Get all Supertypes

    supertypes = MTG::Supertype.all

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mtg-sdk-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
