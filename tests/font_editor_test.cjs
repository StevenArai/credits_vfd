const fs=require('fs'),vm=require('vm'),assert=require('assert');
const html=fs.readFileSync('tools/font-editor.html','utf8');
const built=html.match(/<script id="builtin" type="application\/json">([\s\S]*?)<\/script>/)[1];
const script=html.match(/<script>\s*([\s\S]*?)<\/script>/)[1];
class Element {constructor(){this.children=[];this.value='';this.dataset={};this.attrs={};this.checked=false;}setAttribute(k,v){this.attrs[k]=String(v)}replaceChildren(){this.children=[]}append(...c){this.children.push(...c)}getContext(){return{fillRect(){},fillStyle:''}}showModal(){this.open=true}close(){this.open=false}select(){}click(){if(this.onclick)this.onclick()}}
const elements={};for(const id of [...html.matchAll(/id="([^"]+)"/g)].map(m=>m[1]))elements[id]=new Element();
elements.builtin.textContent=built;elements.color.value='#00e89b';elements.sample.value='Aa°';
let copied='',saved='';const ctx=vm.createContext({document:{getElementById:id=>elements[id],createElement:()=>new Element()},window:{addEventListener(){}},localStorage:{getItem(){return null},setItem(k,v){saved=v}},navigator:{clipboard:{async writeText(s){copied=s}}},alert:s=>{throw Error(s)},console});
vm.runInContext(script,ctx);
function run(s){return vm.runInContext(s,ctx)}
assert.equal(elements.library.children.length,95);assert.equal(elements.grid.children.length,15);
const original=run('glyphs[65]');elements.grid.children[0].onpointerdown({button:0,preventDefault(){}});run('endPaint()');assert.notEqual(run('glyphs[65]'),original);elements.undo.onclick();assert.equal(run('glyphs[65]'),original);elements.redo.onclick();assert.notEqual(run('glyphs[65]'),original);
elements.newchar.value='°';elements.add.onclick();assert.equal(run('current'),176);assert.equal(elements.library.children.length,96);elements.grid.children[0].onpointerdown({button:0,preventDefault(){}});run('endPaint()');
(async()=>{await elements.copy.onclick();const single=JSON.parse(copied);assert.equal(single.unicode,'U+00B0');assert.equal(single.rows.length,5);assert.equal(single.glyphs['176'],'100000000000000');assert(saved);elements.json.value=JSON.stringify(single);elements.apply.onclick();assert.equal(run('glyphs[176]'),'100000000000000');assert.throws(()=>run("validate({format:'credits-font-v1',width:3,height:5,glyphs:{65:'bad'}})"));console.log('Editor logic: edit, undo/redo, add degree, clipboard JSON, reimport, autosave, validation passed (DOM stub; no browser UI).');})();
