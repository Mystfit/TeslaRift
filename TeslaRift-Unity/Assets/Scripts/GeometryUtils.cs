using UnityEngine;
using DotNumerics;
using System;
using System.Collections;
using System.Collections.Generic;


public static class GeometryUtils {

    /*
     * Area of triangle
     */
    public static float AreaOfTriangle(Vector3 a, Vector3 b, Vector3 c)
    {
        float alen = Vector3.Distance(a, b);
        float blen = Vector3.Distance(b, c);
        float clen = Vector3.Distance(c, a);

        return AreaOfTriangle(alen, blen, clen);
    }

    public static float AreaOfTriangle(Vector2 a, Vector2 b, Vector2 c)
    {
        float alen = Vector2.Distance(a, b);
        float blen = Vector2.Distance(b, c);
        float clen = Vector2.Distance(c, a);

        return AreaOfTriangle(alen, blen, clen);
    }

    public static float AreaOfTriangle(float a, float b, float c)
    {
        float p = (a + b + c) * 0.5f;
        return Mathf.Sqrt(p * (p - a) * (p - b) * (p - c));
    }

    public static double VolumeOfTetrahedron(Vector3 a, Vector3 b, Vector3 c, Vector3 d)
    {
        double[,] data = new double[,]{
            {a.x, b.x, c.x, d.x},
            {a.y, b.y, c.y, d.y},
            {a.z, b.z, c.z, d.z},
            {1.0, 1.0, 1.0, 1.0}
        };

        return Math.Abs(new DotNumerics.LinearAlgebra.Matrix(data).Determinant() * (1.0 / 6.0));
    }

    /*
     * Barycentric shape lerping
     */
    public static float[] BarycentricLerp(Vector2 a, Vector2 b, Vector2 c, Vector2 position)
    {
        float[] ratios = new float[3];
        float totalArea = AreaOfTriangle(a, b, c);

        ratios[0] = AreaOfTriangle(b, c, position) / totalArea;
        ratios[1] = AreaOfTriangle(a, c, position) / totalArea;
        ratios[2] = AreaOfTriangle(a, b, position) / totalArea;

        return ratios;
    }


    /*
     * Tetrahedron lerping
     */

    public static float[] BarycentricTetrahedronLerp(Vector3 a, Vector3 b, Vector3 c, Vector3 d, Vector3 position)
    {
        float[] ratios = new float[4];
        float totalArea = (float)VolumeOfTetrahedron(a, b, c, d);

        ratios[0] = (float)VolumeOfTetrahedron(b, c, d, position) / totalArea;
        ratios[1] = (float)VolumeOfTetrahedron(a, c, d, position) / totalArea;
        ratios[2] = (float)VolumeOfTetrahedron(a, b, d, position) / totalArea;
        ratios[3] = (float)VolumeOfTetrahedron(a, b, c, position) / totalArea;

        return ratios;
    }


    //Generates points on the surface of a sphere
    public static Vector3[] PointsOnSphere(int n, float scale)
    {
        return PointsOnSphere(n, scale, 0.0f);
    }

    public static Vector3[] PointsOnSphere(int n, float scale, float randomness)
    {
        Vector3[] pts = new Vector3[n];

        float inc = Mathf.PI * (3 - Mathf.Sqrt(5));
        float off = 2.0f / n;
        float x, y, z, r, phi;
        float randAngle;

        randAngle = (randomness != 0.0f) ? UnityEngine.Random.value * randomness : 1.0f;

        for (int k = 0; k < n; k++)
        {
            y = k * off - 1 + (off / 2);
            r = Mathf.Sqrt(1 - y * y);
            phi = k * inc * randAngle;
            x = Mathf.Cos(phi) * r;
            z = Mathf.Sin(phi) * r;

            pts[k] = new Vector3(x, y, z) * scale;
        }

        return pts;
    }

    /// <summary>
    /// Takes an array of input coordinates used to define a Catmull-Rom spline, and then
    /// samples the resulting spline according to the specified sample count (per span),
    /// populating the output array with the newly sampled coordinates. The returned boolean
    /// indicates whether the operation was successful (true) or not (false).
    /// NOTE: The first and last points specified are used to describe curvature and will be dropped
    /// from the resulting spline. Duplicate them if you wish to include them in the curve.
    /// </summary>
    public static bool CatmullRom(Vector3[] inCoordinates, out Vector3[] outCoordinates, int samples)
    {
        if (inCoordinates.Length < 4)
        {
            outCoordinates = null;
            return false;
        }

        List<Vector3> results = new List<Vector3>();

        for (int n = 1; n < inCoordinates.Length - 2; n++)
            for (int i = 0; i < samples; i++)
                results.Add(PointOnCurve(inCoordinates[n - 1], inCoordinates[n], inCoordinates[n + 1], inCoordinates[n + 2], (1f / samples) * i));

        results.Add(inCoordinates[inCoordinates.Length - 2]);

        outCoordinates = results.ToArray();
        return true;
    }

    /// <summary>
    /// Return a point on the curve between P1 and P2 with P0 and P4 describing curvature, at
    /// the normalized distance t.
    /// </summary>

    public static Vector3 PointOnCurve(Vector3 p0, Vector3 p1, Vector3 p2, Vector3 p3, float t)
    {
        Vector3 result = new Vector3();

        float t0 = ((-t + 2f) * t - 1f) * t * 0.5f;
        float t1 = (((3f * t - 5f) * t) * t + 2f) * 0.5f;
        float t2 = ((-3f * t + 4f) * t + 1f) * t * 0.5f;
        float t3 = ((t - 1f) * t * t) * 0.5f;

        result.x = p0.x * t0 + p1.x * t1 + p2.x * t2 + p3.x * t3;
        result.y = p0.y * t0 + p1.y * t1 + p2.y * t2 + p3.y * t3;
        result.z = p0.z * t0 + p1.z * t1 + p2.z * t2 + p3.z * t3;

        return result;
    }

    public static Vector3[] BuildArcPositions(float radius, float arcLength, int numPoints)
    {
        return BuildArcPositions(radius, arcLength, numPoints, 0.0f, false);
    }

    public static Vector3[] BuildArcPositions(float radius, float arcLength, int numPoints, float minAngle, bool centered)
    {
        Vector3[] points = new Vector3[numPoints];
        float angleInc = arcLength / numPoints;

        if (angleInc < minAngle) angleInc = minAngle;
        float startAngle = (centered) ? ((numPoints - 1) * angleInc) * 0.5f : 0.0f;

        for (int i = 0; i < numPoints; i++)
        {
            //Move this to the carousel
            points[i] = new Vector3(
                Mathf.Cos((i * angleInc) - (startAngle)) * radius,
                Mathf.Sin((i * angleInc) - (startAngle)) * radius,
                0.0f
            );
        }

        return points;
    }

    public static Vector3[] BuildTetrahedronVertices(float radius)
    {
        float angleInc = Mathf.PI * 2.0f / 3.0f;
        Vector2[] points = new Vector2[3];

        for (int i = 0; i < 3; i++)
        {
            points[i].x = Mathf.Cos(angleInc * i - Mathf.PI * 0.5f) * radius;
            points[i].y = Mathf.Sin(angleInc * i - Mathf.PI * 0.5f) * radius;
        }

        return new Vector3[4]{
            new Vector3(points[0].x, -points[1].y, points[0].y),
            new Vector3(points[1].x, -points[1].y, points[1].y),
            new Vector3(points[2].x, -points[1].y, points[2].y),
            new Vector3(0.0f, -points[0].y, 0.0f)
        };
    }

	public static float GetClosestTetrahedronDist(float radius)
	{
		return Mathf.Sin((Mathf.PI * 2.0f / 3.0f) - Mathf.PI * 0.5f) * radius;
	}

    public static int[] tetrahedronindices = new int[12] { 0, 1, 2, 1, 0, 3, 2, 1, 3, 0, 2, 3 };


    /*
     * Closest distance tools
     */

    public static Vector3 GetClosestVertex(Mesh mesh, Vector3 point)
    {
        Vector3 closestVertex = Vector3.zero;
        float closestDist = -1;

        foreach(Vector3 v in mesh.vertices){
            float dist = Vector3.Distance(point, v);
            if (closestDist < 0 || dist < closestDist)
            {
                closestDist = dist;
                closestVertex = v;
            }
        }

        return closestVertex;
    }

    public class BaryCentricDistance
    {
        public BaryCentricDistance(MeshFilter meshfilter)
        {
            _meshfilter = meshfilter;
            _mesh = _meshfilter.sharedMesh;
            _triangles = _mesh.triangles;
            _vertices = _mesh.vertices;
            _transform = meshfilter.transform;
        }

        public struct Result
        {
            public float distanceSquared;
            public float distance
            {
                get
                {
                    return Mathf.Sqrt(distanceSquared);
                }
            }

            public int triangle;
            public Vector3 normal;
            public Vector3 centre;
            public Vector3 closestPoint;
        }

        int[] _triangles;
        Vector3[] _vertices;
        Mesh _mesh;
        MeshFilter _meshfilter;
        Transform _transform;

        public Result GetClosestTriangleAndPoint(Vector3 point)
        {

            point = _transform.InverseTransformPoint(point);
            var minDistance = float.PositiveInfinity;
            var finalResult = new Result();
            var length = (int)(_triangles.Length / 3);
            for (var t = 0; t < length; t++)
            {
                var result = GetTriangleInfoForPoint(point, t);
                if (minDistance > result.distanceSquared)
                {
                    minDistance = result.distanceSquared;
                    finalResult = result;
                }
            }
            finalResult.centre = _transform.TransformPoint(finalResult.centre);
            finalResult.closestPoint = _transform.TransformPoint(finalResult.closestPoint);
            finalResult.normal = _transform.TransformDirection(finalResult.normal);
            finalResult.distanceSquared = (finalResult.closestPoint - point).sqrMagnitude;
            return finalResult;
        }

        public Result GetTriangleInfoForPoint(Vector3 point, int triangle)
        {
            Result result = new Result();

            result.triangle = triangle;
            result.distanceSquared = float.PositiveInfinity;

            if (triangle >= _triangles.Length / 3)
                return result;


            //Get the vertices of the triangle
            var p1 = _vertices[_triangles[0 + triangle * 3]];
            var p2 = _vertices[_triangles[1 + triangle * 3]];
            var p3 = _vertices[_triangles[2 + triangle * 3]];

            result.normal = Vector3.Cross((p2 - p1).normalized, (p3 - p1).normalized);

            //Project our point onto the plane
            var projected = point + Vector3.Dot((p1 - point), result.normal) * result.normal;

            //Calculate the barycentric coordinates
            var u = ((projected.x * p2.y) - (projected.x * p3.y) - (p2.x * projected.y) + (p2.x * p3.y) + (p3.x * projected.y) - (p3.x * p2.y)) /
                    ((p1.x * p2.y) - (p1.x * p3.y) - (p2.x * p1.y) + (p2.x * p3.y) + (p3.x * p1.y) - (p3.x * p2.y));
            var v = ((p1.x * projected.y) - (p1.x * p3.y) - (projected.x * p1.y) + (projected.x * p3.y) + (p3.x * p1.y) - (p3.x * projected.y)) /
                    ((p1.x * p2.y) - (p1.x * p3.y) - (p2.x * p1.y) + (p2.x * p3.y) + (p3.x * p1.y) - (p3.x * p2.y));
            var w = ((p1.x * p2.y) - (p1.x * projected.y) - (p2.x * p1.y) + (p2.x * projected.y) + (projected.x * p1.y) - (projected.x * p2.y)) /
                    ((p1.x * p2.y) - (p1.x * p3.y) - (p2.x * p1.y) + (p2.x * p3.y) + (p3.x * p1.y) - (p3.x * p2.y));

            result.centre = p1 * 0.3333f + p2 * 0.3333f + p3 * 0.3333f;

            //Find the nearest point
            var vector = (new Vector3(u, v, w)).normalized;


            //work out where that point is
            var nearest = p1 * vector.x + p2 * vector.y + p3 * vector.z;
            result.closestPoint = nearest;
            result.distanceSquared = (nearest - point).sqrMagnitude;

            if (float.IsNaN(result.distanceSquared))
            {
                result.distanceSquared = float.PositiveInfinity;
            }
            return result;
        }

    }
}


