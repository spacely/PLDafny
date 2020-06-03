datatype Tree<T> = Leaf | Node(Tree<T>, Tree<T>, T)
datatype List<T> = Nil | Cons(T, List<T>)

function flatten<T>(tree:Tree<T>):List<T>
{
    match tree
    case Leaf => Nil
    case Node(leftnode,rightnode,element) => Cons(element,append(flatten(leftnode),flatten(rightnode)))

	
}

function append<T>(xs:List<T>, ys:List<T>):List<T>
{
    match xs
    case Nil => ys
    case Cons(element,list) => Cons(element,append(list,ys))


	
}

function treeContains<T>(tree:Tree<T>, element:T):bool
{
    match tree
    case Leaf => false
    case Node(leftnode,rightnode,element) => treeContains(leftnode,element) || treeContains(rightnode,element) || element == element



	
}

function listContains<T>(xs:List<T>, element:T):bool
{
	match xs
    case Nil => false
    case Cons(element,list) => listContains(list,element) || element == element
}


lemma sameElements<T>(tree:Tree<T>, element:T)
ensures treeContains(tree, element) <==> listContains(flatten(tree), element)
{
    match tree {
        case Leaf => {}
        case Node(leftnode,rightnode,element) => {
            assert listContains(flatten(tree),element) == listContains(flatten(leftnode,rightnode,element)),element)


        }



    }

	
}