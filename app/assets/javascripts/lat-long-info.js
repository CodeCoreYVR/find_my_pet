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
        window.imageFile = fr.result

        var img = document.createElement('img')
        img.src = fr.result

        document.body.appendChild(img)
        document.body.appendChild(img)
        $('[name*=type]').val('99.32132149496')
        getExif(img)
      })
      fr.readAsDataURL(imageFile)
    })
  }
})

function getExif (img) {
  EXIF.getData(img, function () {
    var longitude = EXIF.getTag(this, 'GPSLongitude')
    var latitude = EXIF.getTag(this, 'GPSLatitude')
    var latAndLong = document.getElementById('latAndLong')
    latAndLong.innerHTML = `${latitude},  ${longitude}`
  })

  EXIF.getData(img, function () {
    var allMetaData = EXIF.getTag(this, 'GPSLongitude')
    allMetaData = EXIF.getTag(this, 'GPSLatitude')
    var allMetaDataSpan = document.getElementById('allMetaDataSpan')
    allMetaDataSpan.innerHTML = JSON.stringify(allMetaData, null, '\t')
  })
}

// A few things. The $(document).ready function is making the map not load on the
// sightings page?! (sightings/show). Now it works.
// Ref:http://www.jstips.co/en/detect-document-ready-in-pure-js/

// make hidden fields in the _form? populated with location data.
// Auto place pin on the map?

// Instead of inserting the img tag into the document body of the current page,
// I want to add it to the All Sightings page. Maybe thats not my job?

// Are all the images going to have the same id with this code?!
// That can't work...

// Also, I want to load a thumbnail image of the pic next to the upload button
// where the  file name is... perhaps the best way of doing this is with a gem that
//  generates thumbnails. Which means do later.
