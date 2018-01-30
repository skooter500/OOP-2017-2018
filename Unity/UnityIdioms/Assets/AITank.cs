using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AITank : MonoBehaviour {
    public Vector3[] path;
    private List<GameObject> allMyParts = new List<GameObject>();
    private Vector3 RandomVelocity()
    {
        return new Vector3(Random.Range(-5, 5), Random.Range(5, 10), Random.Range(-5, 5));
    }
    
    void OnCollisionEnter(Collision c)
    {
        if (c.gameObject.tag == "ground")
        {
            //Debug.Log("Collided");
            // Go to AI Control
            //GetComponent<Rigidbody>().isKinematic = true;
            //GetComponent<Rigidbody>().useGravity = false;
            //GetComponent<Rigidbody>().velocity = Vector3.zero;           
        }

        if (c.gameObject.tag == "Bullet")
        {
            Debug.Log("Hit with bullet");
            // Go to AI Control
            ExplodeMyParts();
        }        
    }
    
    void ExplodeMyParts()
    {
        foreach(GameObject part in allMyParts)
        {
            Rigidbody rb = part.GetComponent<Rigidbody>();
            if (rb == null)
            {
                rb = part.gameObject.AddComponent<Rigidbody>();
            }
            rb.isKinematic = false;
            rb.useGravity = true;
            rb.transform.parent = null;
            rb.velocity = RandomVelocity();

            Sink s = part.GetComponent<Sink>();
            if (s == null)
            {
                part.AddComponent<Sink>();
            }
        }
    }

    // Use this for initialization
    void Start () {
        allMyParts.Add(this.gameObject);
        for (int i = 0; i < transform.childCount; i++)
        {
            allMyParts.Add(transform.GetChild(i).gameObject); ;
        }
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
