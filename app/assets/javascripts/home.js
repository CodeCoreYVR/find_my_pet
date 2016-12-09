$(function() {
  var petList = $("#recent-pet-list");

  if (petList.html()) {
    getPets();
  }

})

function getPets() {
  $.ajax({
    url: 'api/v1/pets',
    success: function (pets) {
      renderPets(pets);
    },
    error: function() {
      console.error('Could not get pet');
    }
  })
}

function renderPets(pets) {
  var petTemplate = $('#recent-pet-list').html();
  var petList = $('#recent-pet-list');

  var petsHTML = pets.slice(0,5).map(function (pet) {
    return PetListItem(pet);
  }).join("");

  petList.html(petsHTML);
}

function PetListItem (pet) {
  return ' \
  <div class="main-list"> \
    <div class="col-md-3 col-xs-6"> \
      <img class="img-circle" src="' + pet.image + '" alt="" /> \
    </div> \
 \
    <div class="col-md-9"> \
      <div class="row"> \
        <div class="col-md-3"> \
          <div>Species</div> \
          <strong>' + pet.pet_type + '</strong> \
        </div> \
 \
        <div class="col-md-3"> \
          <div>Sex</div> \
          <strong>' + pet.gender + '</strong> \
        </div> \
 \
        <div class="col-md-6"> \
          <div>Size</div> \
          <strong>' + pet.size + '</strong> \
        </div> \
      </div> \
      <div class="row"> \
        <div class="col-md-6"> \
          <div>last seen at:</div> \
          <div>' + pet.last_seen_date + '</div> \
        </div> \
        <div class="col-md-6 text-right"> \
          <a href="#" class="btn btn-default btn-xs moreinfo-btn">More info</a> \
          <a href="sightings/new" class="btn btn-primary btn-xs"> <span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span> Report</a> \
        </div> \
      </div> \
    </div> \
  </div> \
  '
}
