class Pokemon {
  constructor(data) {
    this.name = data.name;
    this.hp = data.hp;
    this.attack = data.attack;
    this.defense = data.defense; 
    this.abilities = data.abilities;
  }

  getData(completionCallback) {
    let self = this;

    axios.get('http://pokeapi.co/api/v2/pokemon/' + this.name)
    
    .then(function(response) {
      for(let i = 0; i < response.data.stats.length; i++) {
        if (response.data.stats[i].stat.name == 'hp') {
          self.hp = response.data.stats[i].base_stat;
        } else if (response.data.stats[i].stat.name == 'attack') {
          self.attack = response.data.stats[i].base_stat;
        } else if (response.data.stats[i].stat.name == 'defense') {
          self.defense = response.data.stats[i].base_stat;
        }
      }

      completionCallback();
    });
  }
}

class PokemonTrainer {
  constructor(trainerName, pokemons) {
    this.trainerName = trainerName;
    this.pokemons = pokemons;
  }

  get(pokemonName) {
    for (let i = 0; i < this.pokemons.length; ++i) {
      if (this.pokemons[i].name == pokemonName) {
        return this.pokemons[i];
      }
    }
  }

  all() {
    return this.pokemons;
  }
}

let charmander = new Pokemon({name: 'charmander'});
let jynx = new Pokemon({name: 'jynx'});
let squirtle = new Pokemon({name: 'squirtle'});
let pokemons = [charmander, jynx, squirtle];

let trainerGeorge = new PokemonTrainer('George', pokemons);

jynx.getData(function () {
  console.log('jynx hp: ', jynx.hp, ' jynx attack: ', jynx.attack, ' jynx defense: ', jynx.defense)  
});










