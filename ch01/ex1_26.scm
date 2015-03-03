;; 每次当exp是偶数时，Louis的方法重复计算了(expmod base (/ exp 2) m)，
;; 原先折半的效果达不到了，因此计算过程变成O(n)的了。
