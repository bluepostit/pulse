import $ from 'jquery'

const hideFlashes = (flashes) => {
  flashes.alert('close')
}

const setupFlashTimer = () => {
  const flashes = $('.alert')
  window.setTimeout(() => hideFlashes(flashes), 3000)
}


export { setupFlashTimer }
