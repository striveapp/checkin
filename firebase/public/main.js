'use strict';

function functionsSetup() {
  //Functions buttons
  this.generateBackupButton = document.getElementById('generate-backup-button');
  this.restoreBackupButton = document.getElementById('restore-backup-button');
  this.notifyMasterButton = document.getElementById('notify-master-button');
  this.importLessonTemplateButton = document.getElementById('import-lesson-template-button');
  this.importSubscriptionPlansButton = document.getElementById('import-subscription-plans-button');
  this.generateThisWeekOfLessonInstancesButton = document.getElementById('generate-this-week-of-lesson-instances-button');
  this.generateNextWeekOfLessonInstancesButton = document.getElementById('generate-next-week-of-lesson-instances-button');
  this.generateNext2WeekOfLessonInstancesButton = document.getElementById('generate-next-2-week-of-lesson-instances-button');
  this.createNewGymButton = document.getElementById('create-new-gym-button');

  //Callbacks
  this.generateBackupButton.addEventListener('click', () => this.runFunction( 'generateBackup'));
  this.restoreBackupButton.addEventListener('click', () => () => this.runFunction( 'restoreBackup'));
  this.notifyMasterButton.addEventListener('click', () => this.runFunction('notifyMaster', true));
  this.importLessonTemplateButton.addEventListener('click', () => this.runFunction('importLessonTemplate', true));
  this.importSubscriptionPlansButton.addEventListener('click', () => this.runFunction('importSubscriptionPlans', true));
  this.generateThisWeekOfLessonInstancesButton.addEventListener('click', () => this.runFunction('generateThisWeekOfLessonInstances', true));
  this.generateNextWeekOfLessonInstancesButton.addEventListener('click', () => this.runFunction('generateNextWeekOfLessonInstances', true));
  this.generateNext2WeekOfLessonInstancesButton.addEventListener('click', () => this.runFunction('generateNext2WeekOfLessonInstances', true));
  this.createNewGymButton.addEventListener('click', () => this.runFunction('createNewGym', true));

  //params
  this.gymField = document.getElementById('gym');
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
CommandCabin.prototype.runFunction = function(endpoint, withGymId) {
  var functionUrl;
  if( withGymId ) {
      var gymId = this.gymField.options[this.gymField.selectedIndex].value
      console.debug(`runFunction for gym [${gymId}]`)
      functionUrl = `${window.location.href}${gymId}/${endpoint}`;
  } else {
      functionUrl = `${window.location.href}${endpoint}`;
  }


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
