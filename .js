// energyCalculator(food, football, hour) =>{
// let hour;
// let energy=100 - (hour - 9)(10)
// if (hour>11) {
//   energy = energy + 20
// }
// if(hour>13){
//   energy = energy -30
// }
// if(hour>15){
//   if(food==='salad'){
//     energy = energy + 20
//   } else {
//     energy = energy - 20
//   }
//   if(hour>20){
//     if(football==='win'){
//       energy = energy + 20
//     } else {
//       energy = energy - 20
//     }
//   }
// return energy
// }


function addOrDouble (target)  {
let result=0;
let x;
let a = target;
if (x===0) {
  return result
};
if (a % 2 === 0) {
   x = (a / 2)
} else {
  x = a-1
}
result++
addOrDouble(x)
}



console.log(addOrDouble(10));
