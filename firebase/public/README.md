# How To Use

In order to add new function to test this are the steps to follow:

**index.html**:
```html
<div id="functions-buttons">
     ...
    <!-- My New Function -->
    <div id="your-function-card" class="mdl-card mdl-shadow--2dp mdl-cell">
        <div class="mdl-card__supporting-text mdl-color-text--grey-600">
            <h3>My New Function</h3>
            <button id="your-function-button"
                    class="mdl-color-text--grey-700 mdl-button--raised mdl-button mdl-js-button mdl-js-ripple-effect">
                Trigger
            </button>
        </div>
    </div>
</div>
```

**main.css**
```css
#your-function-card {
  width: 600px;
}
```

**main.js**
```js
function functionsSetup() {
  //[..]
  
  //Functions buttons
  this.yourFunctionButton = document.getElementById('your-function-button');
  
  //Callbacks
  this.yourFunctionButton.addEventListener('click', this.runFunction.bind(this, 'yourFunctionEndPoint'));
}
```