#!/usr/bin/env node
const arg = require('arg')
const uuid = require('uuid')
const getStdin = require('get-stdin')
const { xml2js, js2xml } = require('xml-js')

const args = arg({
  '--name': String
}, {
  permissive: false
})
const name = args['--name']
if (typeof name === 'undefined' || name.length < 1) {
  console.error('Must specify --name argument.')
  process.exit(1)
}

const mutateObj = obj => {
  obj.domain.uuid._text = uuid()
  obj.domain.name._text = name
  obj.domain.devices.disk.transient = {}
  return obj
}

getStdin()
  .then(xml => xml2js(xml, { compact: true }))
  .then(obj => mutateObj(obj))
  .then(obj => js2xml(obj, { compact: true, spaces: 2 }))
  .then(xml => console.log(xml))
