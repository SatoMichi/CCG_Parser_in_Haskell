# CCG_Parser_in_Haskell
Parser of CCG (Combinatory Categorial Grammar) implemented in Haskell  
HaskellによるCCG (組み合わせ範疇文法) パーサーの実装

## What is CCG (Combinatory Categorial Grammar)
CCGはProfessor. Mark Steedmanによって提案された文法理論の一つである。CFG(文脈自由文法)などに代表される文法との違いは各単語が各カテゴリ(自然言語でいえば形態素など)に加えてセマンティクスを担う部分として型付きラムダ式を保持している点であるといえる。  
CCG is a grammatical theory proposed by Professor. Mark Steedman, which differs from grammars such as CFG (Context-Free Grammar) in that each word has a typed lambda expression as its semantics in addition to its category (e.g. part of speech tag in natural language).  

例(example):  
![ccg1](https://user-images.githubusercontent.com/44910734/141712546-0dacaff3-e69d-4168-a081-b189a9fb7df9.JPG)  
A/B = function which takes category B at the right side and return category A  
A\B = function which takes category B at the left side and return category A

There is several gramatical rules:  

Application combinators  
![ccg2](https://user-images.githubusercontent.com/44910734/141713368-03e38218-b7ac-4fa4-b785-6446d709c1b9.JPG)  
">" = forward composition applying function forward (left to right)  
"<" = backward composition applying function backward (right to left)

Composition combinators  
![ccg3](https://user-images.githubusercontent.com/44910734/141713371-80c31f56-9349-475f-b10f-fc4642c0faad.JPG)

Type-raising combinators  
![ccg4](https://user-images.githubusercontent.com/44910734/141713377-3eb06197-009f-40a1-a90a-d0b4bf64455a.JPG)

Substitution  
```
(X/Y)/Z Y/Z => X/Z 
(X/Y)\Z Y\Z => X\Z
Y\Z (X\Y)\Z => X\Z
Y/Z (X\Y)/Z => X/Z
```
retireved from https://qiita.com/q-ikawa/items/cf1bb593185333d88d66

Example of Proof:  
![ccg5](https://user-images.githubusercontent.com/44910734/141713635-1952a3c2-cf66-41f4-bf57-6250e8a93e36.JPG)

In the above steps, we only forcused on category of the each words and (sub-)sentence since we only concentrated on the category of the word and sentences. However by combining semantic lambda function, it is possible to construct the semantic of the whole sentence from semantic of each words.  

Example of Proof with semantic:  
![ccg6](https://user-images.githubusercontent.com/44910734/141714155-b3772c5b-0a53-4dba-ae0d-43a1e2362050.JPG)  
image from (Lee, K. et al, 2014)

## References
- images and gramatical rules retrieved from https://en.wikipedia.org/wiki/Combinatory_categorial_grammar
- implemantation hint retrieved from https://qiita.com/q-ikawa/items/cf1bb593185333d88d66
- Lee, K., Artzi, Y., Dodge, J., & Zettlemoyer, L. (2014). Context-dependent Semantic Parsing for Time Expressions. ACL.