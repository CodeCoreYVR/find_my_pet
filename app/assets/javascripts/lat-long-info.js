/* global FileReader EXIF $ */

$(function () {
  var sightingImageEl = document.getElementById('sighting_image')
  if (sightingImageEl) {
    sightingImageEl.addEventListener('change',
    function (event) {
      var fileInput = event.target
      var imageFile = fileInput.files[0]

      var fr = new FileReader()
      fr.addEventListener('load', function () {
        var thumbnailContainer = document.getElementById('img-thumb')
        var thumbnail = document.createElement('img')
        thumbnail.src = fr.result

        thumbnailContainer.appendChild(thumbnail)

        getExif(thumbnail, function (longitude, latitude) {
          $('[name*=lat]').val(latitude)
          $('[name*=long]').val(longitude)
        })
      })
      fr.readAsDataURL(imageFile)
    })
  }
})

function getExif (img, cb) {
  // if cb is not a function, log an error
  if (typeof (cb) === 'function') {
    EXIF.getData(img, function () {
      var longitude = EXIF.getTag(this, 'GPSLongitude')
      var latitude = EXIF.getTag(this, 'GPSLatitude')
      // var latAndLong = document.getElementById('latAndLong')
      // latAndLong.innerHTML = `${latitude},  ${longitude}`
      var decLat = degToDec(latitude)
      var decLong = degToDec(longitude)
      cb(decLat, decLong)
    })
  } else {
    window.alert('there is no function')
  }
}

// Turns the 'degrees, minutes, seconds' value from the EXIF data into a float.

function degToDec (dmsValue) {
  dmsValue[1] = (dmsValue[2] / 60) + dmsValue[1]
  var decDeg = (dmsValue[1] / 60) + dmsValue[0]
  return decDeg
}
