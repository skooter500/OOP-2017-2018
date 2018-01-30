using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProgGen : MonoBehaviour {

    public GameObject prefab;
    public int sides = 12;
	// Use this for initialization
	void Start () {

        float scale = 0.1f;
        for (float z = 0; z < 20; z+=2)
        {
            for (float x = 0; x < 20; x+=2)
            {
                Vector3 pos = new Vector3(
             x
             , Mathf.PerlinNoise(x * scale, z * scale) * 10
             , z
             );
                pos += transform.position;
                GameObject block = GameObject.Instantiate<GameObject>(prefab);
                block.transform.position = pos;
                block.GetComponent<Renderer>().material.color = new Color(
                    Random.Range(0.0f, 1.0f)
                    , Random.Range(0.0f, 1.0f)
                    , Random.Range(0.0f, 1.0f)
                    );
                block.transform.parent = transform;

            }
        }

        /*
        float thetaInc = Mathf.PI * 2.0f / sides;
        for (int i = 0; i < sides; i++)
        {
            float theta = thetaInc * i;
            Vector3 pos = new Vector3(
                Mathf.Sin(theta) * 20.0f
                , 0
                , Mathf.Cos(theta) * 20.0f
                );
            pos += transform.position;
            GameObject block = GameObject.Instantiate<GameObject>(prefab);
            block.transform.position = pos;
            block.GetComponent<Renderer>().material.color = new Color(
                Random.Range(0.0f, 1.0f)
                , Random.Range(0.0f, 1.0f)
                , Random.Range(0.0f, 1.0f)
                );
            block.transform.parent = transform;
            
        }
        */
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
