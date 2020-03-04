'use strict';

function functionsSetup() {
  //Functions buttons
  this.restoreBackupButton = document.getElementById('restore-backup-button');
  this.notifyMasterButton = document.getElementById('notify-master-button');
  this.importLesssonTemplateButton = document.getElementById('import-lesson-template-button');
  this.generateNextWeekOfLessonInstancesButton = document.getElementById('generate-next-week-of-lesson-instances-button');

  //Callbacks
  this.restoreBackupButton.addEventListener('click', this.runFunction.bind(this, 'restoreBackup'));
  this.notifyMasterButton.addEventListener('click', this.runFunction.bind(this, 'notifyMaster'));
  this.importLesssonTemplateButton.addEventListener('click', this.runFunction.bind(this, 'importLessonTemplate'));
  this.generateNextWeekOfLessonInstancesButton.addEventListener('click', this.runFunction.bind(this, 'generateNextWeekOfLessonInstances'));
}

function DOMSetup() {
  this.loginCard = document.getElementById('login-card');
  this.loginButton = document.getElementById('login-button');
  this.functionsButtons = document.getElementById('functions-buttons');
  this.statusCard = document.getElementById('status-card');
  this.responseContainer = document.getElementById('response');
}

// Initializes the CommandCabin.
function CommandCabin() {
  document.addEventListener('DOMContentLoaded', function() {
    DOMSetup.call(this);
    functionsSetup.call(this);
    firebase.auth().onAuthStateChanged(this.onAuthStateChanged.bind(this));
  }.bind(this));
}

// Triggered on Firebase auth state change.
CommandCabin.prototype.onAuthStateChanged = function(user) {
  if (user) {
    this.loginCard.style.display = 'none';
    this.functionsButtons.style.display = 'block';
  } else {
    this.loginCard.style.display = 'block';
    this.functionsButtons.style.display = 'none';
    this.statusCard.style.display = 'none';
    this.loginButton.addEventListener('click', this.logIn.bind(this));
  }
};

// Initiates the sign-in flow using GoogleAuthProvider sign in in a popup.
CommandCabin.prototype.logIn = function() {
  firebase.auth().signInWithPopup(new firebase.auth.GoogleAuthProvider());
};

// Does an authenticated request to a Firebase Functions endpoint using an Authorization header.
CommandCabin.prototype.runFunction = function(endpoint) {
  var functionUrl = window.location.href + endpoint;
  this.responseContainer.innerText = '...';
  this.statusCard.style.display = 'block';
  firebase.auth().currentUser.getIdToken().then(function(token) {
    console.log('Sending request to', functionUrl, 'with ID token in Authorization header.');
    var req = new XMLHttpRequest();
    req.onload = function() {
      this.responseContainer.innerText = req.responseText;
    }.bind(this);
    req.onerror = function() {
      this.responseContainer.innerText = 'There was an error';
    }.bind(this);
    req.open('GET', functionUrl, true);
    req.setRequestHeader('Authorization', 'Bearer ' + token);
    req.send();
  }.bind(this));
};

// Load the demo.
window.demo = new CommandCabin();
