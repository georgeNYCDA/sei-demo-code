class Stack {
  
  constructor() {
    this.items = [];
  }
  
  push(item) {
    this.items.push(item);
  }
  
  pop() {
    return this.items.pop();
  }
  
  isEmpty() {
    //return (this.items.length === 0);
    if (this.items.length === 0) {
      return true;
    } else {
      return false;
    }
  }
}

// let myStack = new Stack();

// myStack.push(10);
// myStack.push(30);
// myStack.push(103);

// console.log(myStack.pop());
// console.log(myStack.pop());

function isValidCode(codeString) {
  let myStack = new Stack();
  for(let i = 0; i < codeString.length; i++) {
    if (codeString[i] === '{') {
      myStack.push(codeString[i])
    } else if (codeString[i] === '}') {
      if (myStack.isEmpty()) {
        return false;
      }
      
      myStack.pop();
    }
  }
  
  return myStack.isEmpty();
}

let myString = `
  if (a==b) {
      let c = 10;
      let d = 23;
      let h = 23;
  }}
  `;
console.log(isValidCode(myString));  
  